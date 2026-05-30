-- Up Migration: Create Cemetery and Grave tables, and their RPC methods.

-- 1. Create Cemeteries Table
CREATE TABLE public.cemeteries (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    location TEXT NOT NULL,
    description TEXT,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    photo_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Create Graves Table
CREATE TABLE public.graves (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    cemetery_id UUID REFERENCES public.cemeteries(id) ON DELETE CASCADE NOT NULL,
    name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    death_date DATE NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    bio TEXT,
    photo_url TEXT,
    created_by UUID, -- Link to auth.users if needed
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable RLS (Row Level Security)
ALTER TABLE public.cemeteries ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.graves ENABLE ROW LEVEL SECURITY;

-- Read policies: Anyone can view cemeteries and graves
CREATE POLICY "Allow public read cemeteries" ON public.cemeteries FOR SELECT USING (true);
CREATE POLICY "Allow public read graves" ON public.graves FOR SELECT USING (true);

-- Insert policies: Authenticated users can insert graves
CREATE POLICY "Allow authenticated insert graves" ON public.graves FOR INSERT WITH CHECK ((select auth.uid()) IS NOT NULL);

-- Helper function to simulate public.current_user_id()
CREATE OR REPLACE FUNCTION public.current_user_id()
RETURNS VARCHAR
SET search_path = ''
AS $$
BEGIN
  RETURN auth.uid()::VARCHAR;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;


-- 3. RPC to Get Cemeteries
CREATE OR REPLACE FUNCTION public.rpc_get_cemeteries(
    p_query TEXT DEFAULT NULL
)
RETURNS TABLE (
    id UUID,
    name VARCHAR(255),
    location TEXT,
    description TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    photo_url TEXT
)
SET search_path = ''
AS $$
BEGIN
    RETURN QUERY
    SELECT c.id, c.name, c.location, c.description, c.latitude, c.longitude, c.photo_url
    FROM public.cemeteries c
    WHERE p_query IS NULL 
       OR p_query = '' 
       OR c.name ILIKE '%' || p_query || '%' 
       OR c.location ILIKE '%' || p_query || '%';
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;


-- 4. RPC to Search/Get Graves with Pagination & Filtering
CREATE OR REPLACE FUNCTION public.rpc_get_graves(
    p_limit INT,
    p_offset INT,
    p_query TEXT DEFAULT NULL,
    p_cemetery_id UUID DEFAULT NULL
)
RETURNS TABLE (
    id UUID,
    cemetery_id UUID,
    name VARCHAR(255),
    birth_date TEXT,
    death_date TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    bio TEXT,
    photo_url TEXT
)
SET search_path = ''
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        g.id, 
        g.cemetery_id, 
        g.name, 
        g.birth_date::TEXT, 
        g.death_date::TEXT, 
        g.latitude, 
        g.longitude, 
        g.bio, 
        g.photo_url
    FROM public.graves g
    WHERE (p_cemetery_id IS NULL OR g.cemetery_id = p_cemetery_id)
      AND (
        p_query IS NULL 
        OR p_query = '' 
        OR g.name ILIKE '%' || p_query || '%' 
        OR g.bio ILIKE '%' || p_query || '%'
        OR g.birth_date::TEXT ILIKE '%' || p_query || '%'
        OR g.death_date::TEXT ILIKE '%' || p_query || '%'
      )
    ORDER BY g.created_at DESC
    LIMIT p_limit
    OFFSET p_offset;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;


-- 5. RPC to Add a Grave (with validation & secure user ID retrieval inside logic)
CREATE OR REPLACE FUNCTION public.rpc_add_grave(
    p_cemetery_id UUID,
    p_name VARCHAR(255),
    p_birth_date DATE,
    p_death_date DATE,
    p_latitude DOUBLE PRECISION,
    p_longitude DOUBLE PRECISION,
    p_bio TEXT,
    p_photo_url TEXT DEFAULT NULL
)
RETURNS TABLE (
    id UUID,
    cemetery_id UUID,
    name VARCHAR(255),
    birth_date TEXT,
    death_date TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    bio TEXT,
    photo_url TEXT
)
SET search_path = ''
AS $$
DECLARE
    v_user_id VARCHAR(128) := public.current_user_id();
    v_new_grave_id UUID;
BEGIN
    -- Check Authentication
    IF v_user_id IS NULL THEN
        RAISE EXCEPTION '{"code": "UNAUTHORIZED", "message": "Користувач не авторизований"}' USING ERRCODE = '45000';
    END IF;

    -- Validation
    IF p_name IS NULL OR trim(p_name) = '' THEN
        RAISE EXCEPTION '{"code": "VALIDATION_FAILED", "message": "ПІБ є обов''язковим полем"}' USING ERRCODE = '45000';
    END IF;

    IF p_birth_date > p_death_date THEN
        RAISE EXCEPTION '{"code": "VALIDATION_FAILED", "message": "Дата народження не може бути пізнішою за дату смерті"}' USING ERRCODE = '45000';
    END IF;

    -- Insert record
    INSERT INTO public.graves (
        cemetery_id,
        name,
        birth_date,
        death_date,
        latitude,
        longitude,
        bio,
        photo_url,
        created_by
    ) VALUES (
        p_cemetery_id,
        p_name,
        p_birth_date,
        p_death_date,
        p_latitude,
        p_longitude,
        p_bio,
        p_photo_url,
        v_user_id::UUID
    )
    RETURNING public.graves.id INTO v_new_grave_id;

    -- Return the newly created row
    RETURN QUERY
    SELECT 
        g.id, 
        g.cemetery_id, 
        g.name, 
        g.birth_date::TEXT, 
        g.death_date::TEXT, 
        g.latitude, 
        g.longitude, 
        g.bio, 
        g.photo_url
    FROM public.graves g
    WHERE g.id = v_new_grave_id;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;

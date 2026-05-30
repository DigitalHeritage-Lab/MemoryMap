-- Migration: Add protection against duplicate graves using a client-side hash

-- 1. Add hash column to graves table (if not exists)
ALTER TABLE public.graves ADD COLUMN IF NOT EXISTS hash TEXT;

-- (Optional cleanup: remove the old unique index if it was created previously)
DROP INDEX IF EXISTS unique_grave_hash_idx;

-- 2. Update the rpc_add_grave function to check for the hash and return a JSON error
CREATE OR REPLACE FUNCTION public.rpc_add_grave(
    p_cemetery_id UUID,
    p_name VARCHAR(255),
    p_birth_date DATE,
    p_death_date DATE,
    p_latitude DOUBLE PRECISION,
    p_longitude DOUBLE PRECISION,
    p_bio TEXT,
    p_photo_url TEXT DEFAULT NULL,
    p_hash TEXT DEFAULT NULL
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
    v_duplicate_id UUID;
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

    -- Check for duplicates if hash is provided
    IF p_hash IS NOT NULL THEN
        SELECT public.graves.id INTO v_duplicate_id 
        FROM public.graves 
        WHERE public.graves.cemetery_id = p_cemetery_id AND public.graves.hash = p_hash
        LIMIT 1;

        IF v_duplicate_id IS NOT NULL THEN
            RAISE EXCEPTION 'DUPLICATE_GRAVE_DETECTED' USING ERRCODE = 'P0002';
        END IF;
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
        hash,
        created_by
    ) VALUES (
        p_cemetery_id,
        trim(p_name),
        p_birth_date,
        p_death_date,
        p_latitude,
        p_longitude,
        p_bio,
        p_photo_url,
        p_hash,
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

EXCEPTION 
    WHEN others THEN 
        RAISE EXCEPTION USING MESSAGE = json_build_object(
            'formatted_error', CASE 
                WHEN SQLERRM = 'DUPLICATE_GRAVE_DETECTED' THEN SQLERRM
                ELSE 'Failed to add grave.' 
            END,
            'sql_error', SQLERRM,
            'sql_state', SQLSTATE,
            'user_id', v_user_id
        )::text, ERRCODE = 'P0001';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Migration: Add optimizations (indexes and parameterized filters)

-- Enable pg_trgm extension for fuzzy matching ILIKE queries
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Create indexes for graves table
-- 1. Index on foreign key cemetery_id for fast filtering in rpc_get_graves
CREATE INDEX IF NOT EXISTS idx_graves_cemetery_id ON public.graves(cemetery_id);

-- 2. Index on created_at DESC for fast pagination sorting in rpc_get_graves
CREATE INDEX IF NOT EXISTS idx_graves_created_at ON public.graves(created_at DESC);

-- Create Trigram GIN indexes for ILIKE searches
-- 3. Trigram GIN index for cemetery search by name
CREATE INDEX IF NOT EXISTS idx_cemeteries_name_trgm ON public.cemeteries USING gin (name gin_trgm_ops);

-- 4. Trigram GIN index for cemetery search by location
CREATE INDEX IF NOT EXISTS idx_cemeteries_location_trgm ON public.cemeteries USING gin (location gin_trgm_ops);

-- 5. Trigram GIN index for grave search by name
CREATE INDEX IF NOT EXISTS idx_graves_name_trgm ON public.graves USING gin (name gin_trgm_ops);

-- 6. Trigram GIN index for grave search by bio
CREATE INDEX IF NOT EXISTS idx_graves_bio_trgm ON public.graves USING gin (bio gin_trgm_ops);


-- 7. Update rpc_get_cemeteries function to support filtering by ID at database level.
-- Drop old function signature first to avoid conflicts.
DROP FUNCTION IF EXISTS public.rpc_get_cemeteries(TEXT);

CREATE OR REPLACE FUNCTION public.rpc_get_cemeteries(
    p_query TEXT DEFAULT NULL,
    p_id UUID DEFAULT NULL
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
    WHERE (p_id IS NULL OR c.id = p_id)
      AND (p_query IS NULL 
       OR p_query = '' 
       OR c.name ILIKE '%' || p_query || '%' 
       OR c.location ILIKE '%' || p_query || '%');
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

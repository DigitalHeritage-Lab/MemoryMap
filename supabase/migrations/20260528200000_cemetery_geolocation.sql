-- Migration: Add geolocation distance calculation and sorting to rpc_get_cemeteries
DROP FUNCTION IF EXISTS public.rpc_get_cemeteries(TEXT, UUID);

CREATE OR REPLACE FUNCTION public.rpc_get_cemeteries(
    p_query TEXT DEFAULT NULL,
    p_id UUID DEFAULT NULL,
    p_latitude DOUBLE PRECISION DEFAULT NULL,
    p_longitude DOUBLE PRECISION DEFAULT NULL
)
RETURNS TABLE (
    id UUID,
    name VARCHAR(255),
    location TEXT,
    description TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    photo_url TEXT,
    distance_km DOUBLE PRECISION
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.id, 
        c.name, 
        c.location, 
        c.description, 
        c.latitude, 
        c.longitude, 
        c.photo_url,
        CASE 
            WHEN p_latitude IS NOT NULL AND p_longitude IS NOT NULL THEN
                -- Haversine formula in kilometers
                6371.0 * 2.0 * asin(sqrt(
                    power(sin(radians(c.latitude - p_latitude) / 2.0), 2.0) + 
                    cos(radians(p_latitude)) * cos(radians(c.latitude)) * 
                    power(sin(radians(c.longitude - p_longitude) / 2.0), 2.0)
                ))
            ELSE NULL
        END AS distance_km
    FROM public.cemeteries c
    WHERE (p_id IS NULL OR c.id = p_id)
      AND (p_query IS NULL 
       OR p_query = '' 
       OR c.name ILIKE '%' || p_query || '%' 
       OR c.location ILIKE '%' || p_query || '%')
    ORDER BY 
        CASE 
            WHEN p_latitude IS NOT NULL AND p_longitude IS NOT NULL THEN
                -- Sort by distance (Euclidean approximation is faster for sorting than Haversine trig functions)
                (c.latitude - p_latitude) * (c.latitude - p_latitude) + (c.longitude - p_longitude) * (c.longitude - p_longitude)
            ELSE 0
        END ASC,
        c.name ASC;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

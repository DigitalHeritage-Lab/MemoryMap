-- Migration: Create public.cemetery_images table and reference it from public.cemeteries

-- 1. Create cemetery_images table
CREATE TABLE public.cemetery_images (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    url TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable RLS on cemetery_images
ALTER TABLE public.cemetery_images ENABLE ROW LEVEL SECURITY;

-- Read policy: Anyone can view cemetery images
CREATE POLICY "Allow public read cemetery_images" ON public.cemetery_images FOR SELECT USING (true);

-- 2. Add photo_id column referencing public.cemetery_images(id)
ALTER TABLE public.cemeteries ADD COLUMN photo_id UUID REFERENCES public.cemetery_images(id);

-- 3. Populate public.cemetery_images with existing non-null photo_urls and update public.cemeteries
WITH inserted_images AS (
    INSERT INTO public.cemetery_images (url)
    SELECT DISTINCT photo_url FROM public.cemeteries WHERE photo_url IS NOT NULL AND photo_url <> ''
    RETURNING id, url
)
UPDATE public.cemeteries c
SET photo_id = ii.id
FROM inserted_images ii
WHERE c.photo_url = ii.url;

-- 4. Drop the old photo_url column from public.cemeteries
ALTER TABLE public.cemeteries DROP COLUMN photo_url;

-- 5. Drop and recreate rpc_get_cemeteries to LEFT JOIN public.cemetery_images and map url as photo_url
DROP FUNCTION IF EXISTS public.rpc_get_cemeteries(TEXT, UUID, DOUBLE PRECISION, DOUBLE PRECISION);

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
)
SET search_path = ''
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.id, 
        c.name, 
        c.location, 
        c.description, 
        c.latitude, 
        c.longitude, 
        img.url AS photo_url,
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
    LEFT JOIN public.cemetery_images img ON c.photo_id = img.id
    WHERE (p_id IS NULL OR c.id = p_id)
      AND (p_query IS NULL 
       OR p_query = '' 
       OR c.name ILIKE '%' || p_query || '%' 
       OR c.location ILIKE '%' || p_query || '%')
      AND (
        p_latitude IS NULL OR p_longitude IS NULL OR 
        (6371.0 * 2.0 * asin(sqrt(
            power(sin(radians(c.latitude - p_latitude) / 2.0), 2.0) + 
            cos(radians(p_latitude)) * cos(radians(c.latitude)) * 
            power(sin(radians(c.longitude - p_longitude) / 2.0), 2.0)
        ))) <= 50.0
      )
    ORDER BY 
        CASE 
            WHEN p_latitude IS NOT NULL AND p_longitude IS NOT NULL THEN
                -- Sort by distance
                (c.latitude - p_latitude) * (c.latitude - p_latitude) + (c.longitude - p_longitude) * (c.longitude - p_longitude)
            ELSE 0
        END ASC,
        c.name ASC;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;

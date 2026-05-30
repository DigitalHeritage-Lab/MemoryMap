-- Migration: Add rpc_add_cemetery and update rpc_get_cemeteries with filtering & administrative division details

-- 1. Drop existing rpc_get_cemeteries to change return signature
DROP FUNCTION IF EXISTS public.rpc_get_cemeteries(TEXT, UUID, DOUBLE PRECISION, DOUBLE PRECISION);

-- 2. Recreate rpc_get_cemeteries with administrative division filters and additional return fields
CREATE OR REPLACE FUNCTION public.rpc_get_cemeteries(
    p_query TEXT DEFAULT NULL,
    p_id UUID DEFAULT NULL,
    p_latitude DOUBLE PRECISION DEFAULT NULL,
    p_longitude DOUBLE PRECISION DEFAULT NULL,
    p_region_id UUID DEFAULT NULL,
    p_district_id UUID DEFAULT NULL,
    p_settlement_id UUID DEFAULT NULL
)
RETURNS TABLE (
    id UUID,
    name VARCHAR(255),
    location TEXT,
    description TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    photo_url TEXT,
    distance_km DOUBLE PRECISION,
    region_id UUID,
    district_id UUID,
    settlement_id UUID,
    region_name VARCHAR(100),
    district_name VARCHAR(100),
    settlement_name VARCHAR(100),
    settlement_type VARCHAR(20)
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
        END AS distance_km,
        c.region_id,
        c.district_id,
        c.settlement_id,
        r.name AS region_name,
        d.name AS district_name,
        s.name AS settlement_name,
        s.type AS settlement_type
    FROM public.cemeteries c
    LEFT JOIN public.cemetery_images img ON c.photo_id = img.id
    LEFT JOIN public.regions r ON c.region_id = r.id
    LEFT JOIN public.districts d ON c.district_id = d.id
    LEFT JOIN public.settlements s ON c.settlement_id = s.id
    WHERE (p_id IS NULL OR c.id = p_id)
      AND (p_region_id IS NULL OR c.region_id = p_region_id)
      AND (p_district_id IS NULL OR c.district_id = p_district_id)
      AND (p_settlement_id IS NULL OR c.settlement_id = p_settlement_id)
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
                -- Sort by distance squared
                (c.latitude - p_latitude) * (c.latitude - p_latitude) + (c.longitude - p_longitude) * (c.longitude - p_longitude)
            ELSE 0
        END ASC,
        c.name ASC;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;


-- 3. Create rpc_add_cemetery function for creating cemeteries
CREATE OR REPLACE FUNCTION public.rpc_add_cemetery(
    p_name VARCHAR(255),
    p_location TEXT,
    p_description TEXT,
    p_latitude DOUBLE PRECISION,
    p_longitude DOUBLE PRECISION,
    p_region_id UUID,
    p_district_id UUID,
    p_settlement_id UUID,
    p_photo_url TEXT DEFAULT NULL
)
RETURNS TABLE (
    id UUID,
    name VARCHAR(255),
    location TEXT,
    description TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    photo_url TEXT,
    region_id UUID,
    district_id UUID,
    settlement_id UUID
)
SET search_path = ''
AS $$
DECLARE
    v_user_id VARCHAR(128) := public.current_user_id();
    v_new_cemetery_id UUID;
    v_photo_id UUID := NULL;
BEGIN
    -- Check Authentication
    IF v_user_id IS NULL THEN
        RAISE EXCEPTION '{"code": "UNAUTHORIZED", "message": "Користувач не авторизований"}' USING ERRCODE = '45000';
    END IF;

    -- Validation
    IF p_name IS NULL OR trim(p_name) = '' THEN
        RAISE EXCEPTION '{"code": "VALIDATION_FAILED", "message": "Назва цвинтаря є обов''язковою"}' USING ERRCODE = '45000';
    END IF;

    IF p_region_id IS NULL OR p_district_id IS NULL OR p_settlement_id IS NULL THEN
        RAISE EXCEPTION '{"code": "VALIDATION_FAILED", "message": "Всі поля адміністративного розташування є обов''язковими"}' USING ERRCODE = '45000';
    END IF;

    -- Handle photo creation if provided
    IF p_photo_url IS NOT NULL AND trim(p_photo_url) <> '' THEN
        INSERT INTO public.cemetery_images (url)
        VALUES (p_photo_url)
        RETURNING public.cemetery_images.id INTO v_photo_id;
    END IF;

    -- Insert record
    INSERT INTO public.cemeteries (
        name,
        location,
        description,
        latitude,
        longitude,
        photo_id,
        region_id,
        district_id,
        settlement_id
    ) VALUES (
        p_name,
        p_location,
        p_description,
        p_latitude,
        p_longitude,
        v_photo_id,
        p_region_id,
        p_district_id,
        p_settlement_id
    )
    RETURNING public.cemeteries.id INTO v_new_cemetery_id;

    -- Return the newly created row
    RETURN QUERY
    SELECT 
        c.id, 
        c.name, 
        c.location, 
        c.description, 
        c.latitude, 
        c.longitude, 
        img.url AS photo_url,
        c.region_id,
        c.district_id,
        c.settlement_id
    FROM public.cemeteries c
    LEFT JOIN public.cemetery_images img ON c.photo_id = img.id
    WHERE c.id = v_new_cemetery_id;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;

-- Grant execute permissions to public
GRANT EXECUTE ON FUNCTION public.rpc_get_cemeteries(TEXT, UUID, DOUBLE PRECISION, DOUBLE PRECISION, UUID, UUID, UUID) TO public;
GRANT EXECUTE ON FUNCTION public.rpc_add_cemetery(VARCHAR, TEXT, TEXT, DOUBLE PRECISION, DOUBLE PRECISION, UUID, UUID, UUID, TEXT) TO public;

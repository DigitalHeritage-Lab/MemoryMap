BEGIN;
SELECT plan(3);

-- Mock the current_user_id() function to bypass authentication check during tests
CREATE OR REPLACE FUNCTION public.current_user_id()
RETURNS VARCHAR AS $$
BEGIN
  RETURN '11111111-1111-1111-1111-111111111111';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 1. Create a dummy cemetery
INSERT INTO public.cemeteries (id, name, location, latitude, longitude) 
VALUES ('22222222-2222-2222-2222-222222222222', 'Test Cemetery', 'Test Location', 0.0, 0.0);

-- 2. Test successful insertion
SELECT lives_ok(
    $$ 
    SELECT public.rpc_add_grave(
        '22222222-2222-2222-2222-222222222222'::UUID,
        'Тарас Шевченко'::VARCHAR(255),
        '1814-03-09'::DATE,
        '1861-03-10'::DATE,
        50.0::DOUBLE PRECISION,
        30.0::DOUBLE PRECISION,
        'Біографія'::TEXT,
        NULL::TEXT,
        'test_hash_1'::TEXT
    )
    $$,
    'First grave insertion should succeed'
);

-- 3. Test duplicate grave insertion
SELECT throws_matching(
    $$ 
    SELECT public.rpc_add_grave(
        '22222222-2222-2222-2222-222222222222'::UUID,
        'Тарас Шевченко'::VARCHAR(255),
        '1814-03-09'::DATE,
        '1861-03-10'::DATE,
        50.0::DOUBLE PRECISION,
        30.0::DOUBLE PRECISION,
        'Біографія'::TEXT,
        NULL::TEXT,
        'test_hash_1'::TEXT
    )
    $$,
    'DUPLICATE_GRAVE_DETECTED',
    'Second identical grave insertion should fail with DUPLICATE_GRAVE_DETECTED error'
);

-- 4. Test distinct grave insertion (different name and hash)
SELECT lives_ok(
    $$ 
    SELECT public.rpc_add_grave(
        '22222222-2222-2222-2222-222222222222'::UUID,
        'Іван Франко'::VARCHAR(255),
        '1856-08-27'::DATE,
        '1916-05-28'::DATE,
        50.0::DOUBLE PRECISION,
        30.0::DOUBLE PRECISION,
        'Біографія'::TEXT,
        NULL::TEXT,
        'test_hash_2'::TEXT
    )
    $$,
    'Insertion of a different grave should succeed'
);

SELECT * FROM finish();
ROLLBACK;

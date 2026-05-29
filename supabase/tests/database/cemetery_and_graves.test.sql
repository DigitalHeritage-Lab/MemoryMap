-- Test database schema and optimized functions/indexes
BEGIN;
SELECT plan(7);

-- 1. Check tables exist
SELECT has_table('public', 'cemeteries', 'Table public.cemeteries should exist');
SELECT has_table('public', 'graves', 'Table public.graves should exist');
SELECT has_table('public', 'cemetery_images', 'Table public.cemetery_images should exist');

-- 2. Check optimized indexes exist on graves
SELECT has_index('public', 'graves', 'idx_graves_cemetery_id', 'Index idx_graves_cemetery_id should exist');
SELECT has_index('public', 'graves', 'idx_graves_created_at', 'Index idx_graves_created_at should exist');

-- 3. Check functions exist with correct signatures
SELECT has_function('public', 'rpc_get_cemeteries', ARRAY['text', 'uuid', 'double precision', 'double precision'], 'Function rpc_get_cemeteries(text, uuid, double precision, double precision) should exist');
SELECT has_function('public', 'rpc_get_graves', ARRAY['integer', 'integer', 'text', 'uuid'], 'Function rpc_get_graves(integer, integer, text, uuid) should exist');

SELECT * FROM finish();
ROLLBACK;

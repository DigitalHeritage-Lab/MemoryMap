-- Test database schema and optimized functions/indexes
BEGIN;
SELECT plan(16);

-- 1. Check tables exist
SELECT has_table('public', 'cemeteries', 'Table public.cemeteries should exist');
SELECT has_table('public', 'graves', 'Table public.graves should exist');
SELECT has_table('public', 'cemetery_images', 'Table public.cemetery_images should exist');
SELECT has_table('public', 'regions', 'Table public.regions should exist');
SELECT has_table('public', 'districts', 'Table public.districts should exist');
SELECT has_table('public', 'settlements', 'Table public.settlements should exist');

-- 2. Check columns in cemeteries
SELECT has_column('public', 'cemeteries', 'region_id', 'Column region_id should exist in public.cemeteries');
SELECT has_column('public', 'cemeteries', 'district_id', 'Column district_id should exist in public.cemeteries');
SELECT has_column('public', 'cemeteries', 'settlement_id', 'Column settlement_id should exist in public.cemeteries');

-- 3. Check optimized indexes exist on graves
SELECT has_index('public', 'graves', 'idx_graves_cemetery_id', 'Index idx_graves_cemetery_id should exist');
SELECT has_index('public', 'graves', 'idx_graves_created_at', 'Index idx_graves_created_at should exist');

-- 4. Check functions exist with correct signatures
SELECT has_function('public', 'rpc_get_cemeteries', ARRAY['text', 'uuid', 'double precision', 'double precision'], 'Function rpc_get_cemeteries(text, uuid, double precision, double precision) should exist');
SELECT has_function('public', 'rpc_get_graves', ARRAY['integer', 'integer', 'text', 'uuid'], 'Function rpc_get_graves(integer, integer, text, uuid) should exist');
SELECT has_function('public', 'rpc_get_regions', '{}'::name[], 'Function rpc_get_regions() should exist');
SELECT has_function('public', 'rpc_get_districts', ARRAY['uuid'], 'Function rpc_get_districts(uuid) should exist');
SELECT has_function('public', 'rpc_get_settlements', ARRAY['uuid'], 'Function rpc_get_settlements(uuid) should exist');

SELECT * FROM finish();
ROLLBACK;

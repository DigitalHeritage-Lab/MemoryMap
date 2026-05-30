-- Migration: Ukraine administrative division (regions, districts, settlements)

-- 1. Create regions table (Oblasts + Crimea + Kyiv City)
CREATE TABLE public.regions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Create districts table (Raions)
CREATE TABLE public.districts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    region_id UUID REFERENCES public.regions(id) ON DELETE CASCADE NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    CONSTRAINT unique_region_district_name UNIQUE (region_id, name)
);

-- 3. Create settlements table (Localities)
CREATE TABLE public.settlements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    district_id UUID REFERENCES public.districts(id) ON DELETE CASCADE NOT NULL,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(20) NOT NULL, -- 'місто', 'смт', 'село', 'селище'
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    CONSTRAINT unique_district_settlement_name_type UNIQUE (district_id, name, type)
);

-- Enable RLS
ALTER TABLE public.regions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.districts ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.settlements ENABLE ROW LEVEL SECURITY;

-- Read policies
CREATE POLICY "Allow public read regions" ON public.regions FOR SELECT USING (true);
CREATE POLICY "Allow public read districts" ON public.districts FOR SELECT USING (true);
CREATE POLICY "Allow public read settlements" ON public.settlements FOR SELECT USING (true);

-- 4. Add administrative division links to cemeteries table
ALTER TABLE public.cemeteries ADD COLUMN region_id UUID REFERENCES public.regions(id);
ALTER TABLE public.cemeteries ADD COLUMN district_id UUID REFERENCES public.districts(id);
ALTER TABLE public.cemeteries ADD COLUMN settlement_id UUID REFERENCES public.settlements(id);

-- 5. Create RPC functions for cascading dropdowns
CREATE OR REPLACE FUNCTION public.rpc_get_regions()
RETURNS TABLE (
    id UUID,
    name VARCHAR(100)
)
SET search_path = ''
AS $$
BEGIN
    RETURN QUERY
    SELECT r.id, r.name
    FROM public.regions r
    ORDER BY r.name ASC;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;

CREATE OR REPLACE FUNCTION public.rpc_get_districts(
    p_region_id UUID
)
RETURNS TABLE (
    id UUID,
    region_id UUID,
    name VARCHAR(100)
)
SET search_path = ''
AS $$
BEGIN
    RETURN QUERY
    SELECT d.id, d.region_id, d.name
    FROM public.districts d
    WHERE d.region_id = p_region_id
    ORDER BY d.name ASC;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;

CREATE OR REPLACE FUNCTION public.rpc_get_settlements(
    p_district_id UUID
)
RETURNS TABLE (
    id UUID,
    district_id UUID,
    name VARCHAR(100),
    type VARCHAR(20)
)
SET search_path = ''
AS $$
BEGIN
    RETURN QUERY
    SELECT s.id, s.district_id, s.name, s.type
    FROM public.settlements s
    WHERE s.district_id = p_district_id
    ORDER BY s.name ASC;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;

-- 6. Seed Ukraine regions
INSERT INTO public.regions (id, name) VALUES
  ('00000000-0000-0000-0000-000000000001', 'Вінницька область'),
  ('00000000-0000-0000-0000-000000000002', 'Волинська область'),
  ('00000000-0000-0000-0000-000000000003', 'Дніпропетровська область'),
  ('00000000-0000-0000-0000-000000000004', 'Донецька область'),
  ('00000000-0000-0000-0000-000000000005', 'Житомирська область'),
  ('00000000-0000-0000-0000-000000000006', 'Закарпатська область'),
  ('00000000-0000-0000-0000-000000000007', 'Запорізька область'),
  ('00000000-0000-0000-0000-000000000008', 'Івано-Франківська область'),
  ('00000000-0000-0000-0000-000000000009', 'Київська область'),
  ('00000000-0000-0000-0000-000000000010', 'Кіровоградська область'),
  ('00000000-0000-0000-0000-000000000011', 'Луганська область'),
  ('00000000-0000-0000-0000-000000000012', 'Львівська область'),
  ('00000000-0000-0000-0000-000000000013', 'Миколаївська область'),
  ('00000000-0000-0000-0000-000000000014', 'Одеська область'),
  ('00000000-0000-0000-0000-000000000015', 'Полтавська область'),
  ('00000000-0000-0000-0000-000000000016', 'Рівненська область'),
  ('00000000-0000-0000-0000-000000000017', 'Сумська область'),
  ('00000000-0000-0000-0000-000000000018', 'Тернопільська область'),
  ('00000000-0000-0000-0000-000000000019', 'Харківська область'),
  ('00000000-0000-0000-0000-000000000020', 'Херсонська область'),
  ('00000000-0000-0000-0000-000000000021', 'Хмельницька область'),
  ('00000000-0000-0000-0000-000000000022', 'Черкаська область'),
  ('00000000-0000-0000-0000-000000000023', 'Чернівецька область'),
  ('00000000-0000-0000-0000-000000000024', 'Чернігівська область'),
  ('00000000-0000-0000-0000-000000000025', 'Автономна Республіка Крим'),
  ('00000000-0000-0000-0000-000000000026', 'м. Київ');

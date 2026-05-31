-- 1. Create ocr_requests table
CREATE TABLE public.ocr_requests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    status VARCHAR(50) DEFAULT 'processing' NOT NULL, -- processing, complete, error
    file_path TEXT NOT NULL,
    result_data JSONB,
    error_message TEXT,
    created_by UUID REFERENCES auth.users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Enable RLS
ALTER TABLE public.ocr_requests ENABLE ROW LEVEL SECURITY;

-- Policies for ocr_requests
CREATE POLICY "Users can insert their own ocr_requests" 
ON public.ocr_requests FOR INSERT 
WITH CHECK (auth.uid() = created_by);

CREATE POLICY "Users can view their own ocr_requests" 
ON public.ocr_requests FOR SELECT 
USING (auth.uid() = created_by);

CREATE POLICY "Users can update their own ocr_requests"
ON public.ocr_requests FOR UPDATE
USING (auth.uid() = created_by)
WITH CHECK (auth.uid() = created_by);

-- RPC to create OCR request
CREATE OR REPLACE FUNCTION public.rpc_create_ocr_request(
    p_file_path TEXT
)
RETURNS TABLE (id UUID)
SET search_path = ''
AS $$
DECLARE
    v_user_id VARCHAR(128) := public.current_user_id();
    v_new_id UUID;
BEGIN
    INSERT INTO public.ocr_requests (file_path, created_by)
    VALUES (p_file_path, v_user_id::UUID)
    RETURNING public.ocr_requests.id INTO v_new_id;
    
    RETURN QUERY SELECT v_new_id;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;

-- RPC to get OCR request status
CREATE OR REPLACE FUNCTION public.rpc_get_ocr_request(
    p_id UUID
)
RETURNS TABLE (
    status VARCHAR(50),
    result_data JSONB,
    error_message TEXT
)
SET search_path = ''
AS $$
BEGIN
    RETURN QUERY 
    SELECT o.status, o.result_data, o.error_message
    FROM public.ocr_requests o
    WHERE o.id = p_id;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;


-- 2. Create grave_photos bucket
INSERT INTO storage.buckets (id, name, public) 
VALUES ('grave_photos', 'grave_photos', true) 
ON CONFLICT (id) DO NOTHING;

-- 3. Storage policies for grave_photos
CREATE POLICY "Public read access to grave_photos"
ON storage.objects FOR SELECT
USING (bucket_id = 'grave_photos');

CREATE POLICY "Authenticated users can upload grave_photos"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'grave_photos' AND auth.uid() = owner);

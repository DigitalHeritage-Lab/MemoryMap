import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.43.4'
import { GoogleGenerativeAI } from 'https://esm.sh/@google/generative-ai@0.21.0'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

import { Buffer } from "node:buffer"

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    const { requestId, photoPath } = await req.json()
    
    if (!requestId || !photoPath) {
      return new Response(JSON.stringify({ error: 'requestId and photoPath are required' }), {
        status: 400,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }

    // @ts-ignore: EdgeRuntime is provided by Supabase Edge Functions environment
    EdgeRuntime.waitUntil(
      (async () => {
        const supabase = createClient(
          Deno.env.get('SUPABASE_URL') ?? '',
          Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
        )

        try {
          console.log(`Starting background OCR for request ${requestId} with path ${photoPath}`);
          
          const { data: fileData, error: downloadError } = await supabase
            .storage
            .from('grave_photos')
            .download(photoPath)

          if (downloadError) throw downloadError

          const arrayBuffer = await fileData.arrayBuffer()
          const base64Data = Buffer.from(arrayBuffer).toString('base64')

          const genAI = new GoogleGenerativeAI(Deno.env.get('GEMINI_API_KEY') ?? '')
          const model = genAI.getGenerativeModel({ 
            model: 'gemini-3.1-flash-lite',
            generationConfig: {
              responseMimeType: 'application/json'
            }
          })

          const prompt = 'Extract the full name (ПІБ), birth date, and death date from this grave stone image. ' +
            'Return ONLY a valid JSON object with keys: "fullName", "birthDate" (format YYYY-MM-DD), ' +
            '"deathDate" (format YYYY-MM-DD). If a value is not found, return null for that key.'

          const imageParts = [
            {
              inlineData: {
                data: base64Data,
                mimeType: fileData.type || 'image/jpeg'
              },
            },
          ]

          const result = await model.generateContent([prompt, ...imageParts])
          const responseText = result.response.text()

          let cleanText = responseText.trim()
          if (cleanText.startsWith('```')) {
            const firstNewline = cleanText.indexOf('\n')
            if (firstNewline !== -1) {
              cleanText = cleanText.substring(firstNewline + 1)
            } else {
              cleanText = cleanText.replace(/^```(json)?/, '')
            }
          }
          if (cleanText.endsWith('```')) {
            cleanText = cleanText.substring(0, cleanText.length - 3).trim()
          }

          const parsedData = JSON.parse(cleanText)

          await supabase
            .from('ocr_requests')
            .update({
              status: 'complete',
              result_data: parsedData
            })
            .eq('id', requestId)

          console.log(`OCR complete for request ${requestId}`);
        } catch (error) {
          console.error(`Error in OCR background task for ${requestId}:`, error)
          
          await supabase
            .from('ocr_requests')
            .update({
              status: 'error',
              error_message: error instanceof Error ? error.message : String(error)
            })
            .eq('id', requestId)
        }
      })()
    )

    return new Response(JSON.stringify({ message: 'OCR process started' }), {
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    })
  } catch (error) {
    return new Response(JSON.stringify({ error: error instanceof Error ? error.message : String(error) }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    })
  }
})

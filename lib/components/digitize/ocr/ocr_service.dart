import 'dart:developer';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OcrResult {
  OcrResult({
    this.fullName,
    this.birthDate,
    this.deathDate,
    this.photoUrl,
  });
  final String? fullName;
  final String? birthDate;
  final String? deathDate;
  final String? photoUrl;
}

@lazySingleton
class OcrService {
  Future<OcrResult> processImage(String imagePath) async {
    log('ASYNC OCR START for $imagePath');
    final supabase = Supabase.instance.client;

    // 1. Upload image to Storage
    final ext = imagePath.split('.').last;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.$ext';
    final file = File(imagePath);

    await supabase.storage.from('grave_photos').upload(fileName, file);

    // 2. Create ocr_requests row via RPC
    final response = await supabase.rpc<List<dynamic>>(
      'rpc_create_ocr_request',
      params: {
        'p_file_path': fileName,
      },
    );

    // The RPC returns a list of rows, we take the first one's id
    final requestId = (response.first as Map<String, dynamic>)['id'] as String;

    // 3. Call Edge Function to start background processing
    await supabase.functions.invoke(
      'process-grave-ocr',
      body: {
        'requestId': requestId,
        'photoPath': fileName,
      },
    );

    // 4. Poll for completion
    log('Waiting for OCR completion via RPC polling...');
    var attempts = 0;
    const maxAttempts = 30; // 30 * 2s = 60 seconds

    while (attempts < maxAttempts) {
      await Future<void>.delayed(const Duration(seconds: 2));
      attempts++;

      final statusResponse = await supabase.rpc<List<dynamic>>(
        'rpc_get_ocr_request',
        params: {
          'p_id': requestId,
        },
      );

      if (statusResponse.isEmpty) {
        continue; // Wait for the record to be available
      }

      final statusData = statusResponse.first as Map<String, dynamic>;
      final status = statusData['status'] as String;

      if (status == 'processing') {
        continue;
      }

      if (status == 'error') {
        throw Exception(statusData['error_message'] ?? 'Unknown OCR error');
      }

      if (status == 'complete' && statusData['result_data'] != null) {
        final data = statusData['result_data'] as Map<String, dynamic>;
        final publicUrl =
            supabase.storage.from('grave_photos').getPublicUrl(fileName);

        return OcrResult(
          fullName: data['fullName'] as String?,
          birthDate: data['birthDate'] as String?,
          deathDate: data['deathDate'] as String?,
          photoUrl: publicUrl,
        );
      }
    }

    throw Exception('OCR timed out after 60 seconds');
  }

  Future<void> dispose() async {}
}

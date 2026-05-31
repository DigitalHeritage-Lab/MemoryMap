import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

class OcrResult {
  OcrResult({
    this.fullName,
    this.birthDate,
    this.deathDate,
  });
  final String? fullName;
  final String? birthDate;
  final String? deathDate;
}

@lazySingleton
class OcrService {
  Future<OcrResult> processImage(String imagePath) async {
    log('GEMINI OCR START for $imagePath');
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('GEMINI_API_KEY is not set in .env file');
    }

    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
      ),
    );

    final imageBytes = await File(imagePath).readAsBytes();
    final prompt = TextPart(
      'Extract the full name (ПІБ), birth date, and death date from this '
      'grave stone image. '
      'Return ONLY a valid JSON object with keys: "fullName", "birthDate" '
      '(format YYYY-MM-DD), "deathDate" (format YYYY-MM-DD). '
      'If a value is not found, return null for that key.',
    );
    final imagePart = DataPart('image/jpeg', imageBytes);

    final response = await model.generateContent([
      Content.multi([prompt, imagePart]),
    ]);

    log('GEMINI RESULT: \n${response.text}');

    if (response.text != null) {
      final data = jsonDecode(response.text!) as Map<String, dynamic>;
      return OcrResult(
        fullName: data['fullName'] as String?,
        birthDate: data['birthDate'] as String?,
        deathDate: data['deathDate'] as String?,
      );
    }
    return OcrResult();
  }

  Future<void> dispose() async {}
}

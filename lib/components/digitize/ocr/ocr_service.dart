import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
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
    final recognizedText = await FlutterTesseractOcr.extractText(
      imagePath,
      language: 'ukr',
      args: {
        'preserve_interword_spaces': '1',
      },
    );

    return _parseText(recognizedText);
  }

  OcrResult _parseText(String text) {
    String? fullName;
    String? birthDate;
    String? deathDate;

    // Регулярний вираз для пошуку дат: dd.mm.yyyy, dd-mm-yyyy, yyyy.mm.dd
    final dateRegExp =
        RegExp(r'\b(\d{2}[./-]\d{2}[./-]\d{4}|\d{4}[./-]\d{2}[./-]\d{2})\b');
    final matches = dateRegExp.allMatches(text).map((m) => m.group(0)).toList();

    if (matches.isNotEmpty) {
      birthDate = _formatDate(matches.first!);
      if (matches.length > 1) {
        deathDate = _formatDate(matches[1]!);
      }
    }

    // Евристика для ПІБ: беремо перші рядки, які містять літери і не містять
    // цифр.
    final lines = text
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    final nameParts = <String>[];
    final letterRegExp = RegExp('[A-Za-zА-Яа-яІіЇїЄєҐґ]');
    final numberRegExp = RegExp(r'\d');

    for (final line in lines) {
      if (letterRegExp.hasMatch(line) && !numberRegExp.hasMatch(line)) {
        final lowerLine = line.toLowerCase();
        if (lowerLine.contains('пам') || lowerLine.contains('спочивай')) {
          continue;
        }
        nameParts.add(line);
        if (nameParts.length >= 3) break;
      }
    }

    if (nameParts.isNotEmpty) {
      fullName = nameParts.join(' ');
    }

    return OcrResult(
      fullName: fullName,
      birthDate: birthDate,
      deathDate: deathDate,
    );
  }

  String _formatDate(String dateStr) {
    try {
      final parts = dateStr.replaceAll(RegExp('[./]'), '-').split('-');
      if (parts.length == 3) {
        if (parts[0].length == 4) {
          return '${parts[0]}-${parts[1].padLeft(2, '0')}-'
              '${parts[2].padLeft(2, '0')}';
        } else if (parts[2].length == 4) {
          return '${parts[2]}-${parts[1].padLeft(2, '0')}-'
              '${parts[0].padLeft(2, '0')}';
        }
      }
    } on Exception catch (_) {
      // Ignore parse errors and return original string
    }
    return dateStr;
  }

  Future<void> dispose() async {}
}

import 'package:flutter/material.dart';
import 'package:memory_map/shared/constants/enum.dart';

class SendingTextWidget extends StatelessWidget {
  const SendingTextWidget({
    required this.status,
    super.key,
    this.errorText,
    this.successText,
    this.sendingText,
  });

  final LoadingStatus status;
  final String? errorText;
  final String? successText;
  final String? sendingText;

  @override
  Widget build(BuildContext context) {
    if (status == LoadingStatus.initial) {
      return const SizedBox.shrink();
    }

    Widget content;
    switch (status) {
      case LoadingStatus.loading:
        content = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                    AlwaysStoppedAnimation<Color>(Color(0xFF10B981)), // Emerald
              ),
            ),
            const SizedBox(width: 8),
            Text(
              sendingText ?? 'Збереження...',
              style: const TextStyle(
                color: Color(0xFF94A3B8), // Slate 400
                fontSize: 14,
              ),
            ),
          ],
        );
      case LoadingStatus.loaded:
        content = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Color(0xFF10B981), // Emerald
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              successText ?? 'Успішно збережено!',
              style: const TextStyle(
                color: Color(0xFF10B981),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      case LoadingStatus.error:
        content = Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.error_outline,
              color: Color(0xFFEF4444), // Red
              size: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                errorText ?? 'Помилка збереження',
                style: const TextStyle(
                  color: Color(0xFFEF4444),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      case LoadingStatus.initial:
        content = const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: content,
    );
  }
}

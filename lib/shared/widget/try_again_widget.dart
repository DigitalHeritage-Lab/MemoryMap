import 'package:flutter/material.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class TryAgainWidget extends StatelessWidget {
  const TryAgainWidget({
    required this.onRetry,
    this.message,
    super.key,
  });

  final VoidCallback onRetry;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.sentiment_dissatisfied_outlined,
              color: AppColors.slate500, // Slate 500
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              message ?? context.l10n.defaultError,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.slate400, // Slate 400
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            AppButton(
              onPressed: onRetry,
              text: context.l10n.tryAgain,
              icon: Icons.refresh,
              width: null,
            ),
          ],
        ),
      ),
    );
  }
}

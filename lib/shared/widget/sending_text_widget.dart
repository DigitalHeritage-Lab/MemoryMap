import 'package:flutter/material.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

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
            SizedBox(
              width: AppSpacing.m,
              height: AppSpacing.m,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.emerald),
              ),
            ),
            SizedBox(width: AppSpacing.xs),
            Text(
              sendingText ?? context.l10n.saving,
              style: AppTextStyles.label.copyWith(
                color: AppColors.slate400,
              ),
            ),
          ],
        );
      case LoadingStatus.loaded:
        content = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: AppColors.emerald,
              size: AppSpacing.m,
            ),
            SizedBox(width: AppSpacing.xs),
            Text(
              successText ?? context.l10n.saveSuccess,
              style: AppTextStyles.label.copyWith(
                color: AppColors.emerald,
              ),
            ),
          ],
        );
      case LoadingStatus.error:
        content = Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.error_outline,
              color: AppColors.red,
              size: AppSpacing.m,
            ),
            SizedBox(width: AppSpacing.xs),
            Expanded(
              child: Text(
                errorText ?? context.l10n.saveErrorGeneric,
                style: AppTextStyles.label.copyWith(
                  color: AppColors.red,
                ),
              ),
            ),
          ],
        );
      case LoadingStatus.initial:
        content = const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: content,
    );
  }
}

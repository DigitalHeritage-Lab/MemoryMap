import 'package:flutter/material.dart';
import 'package:memory_map/shared/constants/theme/app_colors.dart';
import 'package:memory_map/shared/constants/theme/app_spacing.dart';
import 'package:memory_map/shared/constants/theme/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.width = double.infinity,
    this.padding,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? width;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null && !isLoading;

    const disabledBgColor = AppColors.slate800;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: isEnabled && backgroundColor == null
            ? const LinearGradient(
                colors: [
                  AppColors.deepEmerald,
                  AppColors.teal,
                ], // Emerald to Teal
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isEnabled
            ? (backgroundColor ?? AppColors.deepEmerald)
            : disabledBgColor,
        border: Border.all(
          color: isEnabled
              ? AppColors.emerald.withValues(alpha: 0.3)
              : AppColors.slate700,
        ),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: AppColors.emerald.withValues(alpha: 0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isEnabled ? onPressed : null,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            // Internal padding to ensure the whole area is clickable and
            // feedback looks good
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: AppSpacing.m,
                  horizontal: AppSpacing.xl,
                ),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          Icon(icon, color: Colors.white, size: 18),
                          SizedBox(width: AppSpacing.xs),
                        ],
                        Text(
                          text,
                          style: AppTextStyles.button.copyWith(
                            color: isEnabled
                                ? (textColor ?? Colors.white)
                                : AppColors.slate500,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

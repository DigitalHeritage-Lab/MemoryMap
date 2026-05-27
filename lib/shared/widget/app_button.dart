import 'package:flutter/material.dart';

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
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null && !isLoading;

    const disabledBgColor = Color(0xFF1E293B);

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: isEnabled && backgroundColor == null
            ? const LinearGradient(
                colors: [
                  Color(0xFF064E3B),
                  Color(0xFF0F766E),
                ], // Emerald to Teal
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isEnabled
            ? (backgroundColor ?? const Color(0xFF064E3B))
            : disabledBgColor,
        border: Border.all(
          color: isEnabled
              ? const Color(0xFF10B981).withValues(alpha: 0.3)
              : const Color(0xFF334155),
        ),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: const Color(0xFF10B981).withValues(alpha: 0.15),
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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                          const SizedBox(width: 8),
                        ],
                        Text(
                          text,
                          style: TextStyle(
                            color: isEnabled
                                ? (textColor ?? Colors.white)
                                : const Color(0xFF64748B),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
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

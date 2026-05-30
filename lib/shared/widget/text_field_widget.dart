import 'package:flutter/material.dart';
import 'package:memory_map/shared/constants/theme/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.labelText,
    super.key,
    this.controller,
    this.hintText,
    this.errorText,
    this.showErrorText = false,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String labelText;
  final String? hintText;
  final String? errorText;
  final bool showErrorText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int maxLines;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final hasError =
        showErrorText && errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty) ...[
          Text(
            labelText,
            style: const TextStyle(
              color: AppColors.slate400, // Slate 400
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLines: maxLines,
          onTap: onTap,
          onChanged: onChanged,
          style: const TextStyle(
            color: AppColors.slate50,
            fontSize: 16,
          ),
          cursorColor: AppColors.emerald, // Emerald cursor
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.slate600, // Slate 600
              fontSize: 16,
            ),
            filled: true,
            fillColor: readOnly
                ? AppColors.slate900
                : AppColors.slate800, // Slate 900 vs 800
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: hasError
                    ? AppColors.red
                    : AppColors.slate700, // Red vs Slate 700
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: hasError
                    ? AppColors.red
                    : AppColors.emerald, // Red vs Emerald
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.red,
                width: 1.5,
              ),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 6),
          Text(
            errorText!,
            style: const TextStyle(
              color: AppColors.red, // Red 500
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    );
  }
}

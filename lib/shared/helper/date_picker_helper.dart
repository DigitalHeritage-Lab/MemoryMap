import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memory_map/shared/shared.dart';

class DatePickerHelper {
  DatePickerHelper._();

  static Future<String?> pickDateFormatted({
    required BuildContext context,
  }) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 50),
      firstDate: DateTime(1700),
      lastDate: now,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.emerald,
            surface: AppColors.slate800,
            onSurface: AppColors.slate50,
          ),
        ),
        child: child!,
      ),
    );

    if (picked == null) return null;
    return DateFormat('yyyy-MM-dd').format(picked);
  }
}

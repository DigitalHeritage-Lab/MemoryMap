import 'package:flutter/material.dart';
import 'package:memory_map/components/digitize/widget/bloc_provider/digitize_bloc_provider.dart';
import 'package:memory_map/components/digitize/widget/body/digitize_body.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class DigitizeScreen extends StatelessWidget {
  const DigitizeScreen({super.key, this.initialImagePath});
  final String? initialImagePath;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.addGrave,
          style: const TextStyle(
            color: AppColors.slate50,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.slate900,
        elevation: 0,
      ),
      body: DigitizeBlocProvider(
        initialImagePath: initialImagePath,
        child: const DigitizeBody(),
      ),
    );
  }
}

import 'package:empty_template/components/digitize/widget/bloc_provider/digitize_bloc_provider.dart';
import 'package:empty_template/components/digitize/widget/body/digitize_body.dart';
import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';

class DigitizeScreen extends StatelessWidget {
  const DigitizeScreen({super.key});

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
      body: const DigitizeBlocProvider(
        child: DigitizeBody(),
      ),
    );
  }
}

import 'package:empty_template/components/cemeteries/widget/bloc_provider/cemeteries_bloc_provider.dart';
import 'package:empty_template/components/cemeteries/widget/body/cemeteries_body.dart';
import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';

class CemeteriesScreen extends StatelessWidget {
  const CemeteriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.appTitle,
          style: const TextStyle(
            color: AppColors.slate50,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.slate900,
        elevation: 0,
      ),
      body: const CemeteriesBlocProvider(
        child: CemeteriesBody(),
      ),
    );
  }
}

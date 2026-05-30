import 'package:flutter/material.dart';
import 'package:memory_map/components/graves/widget/bloc_provider/graves_bloc_provider.dart';
import 'package:memory_map/components/graves/widget/body/graves_body.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class GravesScreen extends StatelessWidget {
  const GravesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.navGraves,
          style: const TextStyle(
            color: AppColors.slate50,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.slate900,
        elevation: 0,
      ),
      body: const GravesBlocProvider(
        child: GravesBody(),
      ),
    );
  }
}

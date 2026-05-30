import 'package:flutter/material.dart';
import 'package:memory_map/components/cemeteries/widget/bloc_provider/cemetery_detail_bloc_provider.dart';
import 'package:memory_map/components/cemeteries/widget/body/cemetery_detail_body.dart';
import 'package:memory_map/shared/shared.dart';

class CemeteryDetailScreen extends StatelessWidget {
  const CemeteryDetailScreen({
    required this.cemeteryId,
    super.key,
  });

  final String cemeteryId;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: CemeteryDetailBlocProvider(
        cemeteryId: cemeteryId,
        child: const CemeteryDetailBody(),
      ),
    );
  }
}

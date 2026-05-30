import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/map/bloc/map_bloc.dart';
import 'package:memory_map/components/map/widget/body/map_body.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.navMap,
          style: const TextStyle(
            color: AppColors.slate50,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.slate900,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) =>
            getIt<MapBloc>()..add(const MapEvent.loadMarkers()),
        child: const MapBody(),
      ),
    );
  }
}

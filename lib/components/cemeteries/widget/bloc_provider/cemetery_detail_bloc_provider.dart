import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:memory_map/components/cemeteries/bloc/cemetery_detail_bloc.dart';

class CemeteryDetailBlocProvider extends StatelessWidget {
  const CemeteryDetailBlocProvider({
    required this.cemeteryId,
    required this.child,
    super.key,
  });

  final String cemeteryId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<CemeteryDetailBloc>()
        ..add(CemeteryDetailEvent.loadCemeteryDetail(cemeteryId)),
      child: child,
    );
  }
}

import 'package:empty_template/components/cemeteries/bloc/cemetery_detail_bloc.dart';
import 'package:empty_template/shared/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (context) => getIt<CemeteryDetailBloc>()
        ..add(CemeteryDetailEvent.loadCemeteryDetail(cemeteryId)),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/cemeteries/bloc/cemeteries_bloc.dart';
import 'package:memory_map/shared/di/injection.dart';

class CemeteriesBlocProvider extends StatelessWidget {
  const CemeteriesBlocProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CemeteriesBloc>()..add(const CemeteriesEvent.loadCemeteries()),
      child: child,
    );
  }
}

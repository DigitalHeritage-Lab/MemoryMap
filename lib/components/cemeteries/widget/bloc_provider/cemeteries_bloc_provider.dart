import 'package:empty_template/components/cemeteries/bloc/cemeteries_bloc.dart';
import 'package:empty_template/shared/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

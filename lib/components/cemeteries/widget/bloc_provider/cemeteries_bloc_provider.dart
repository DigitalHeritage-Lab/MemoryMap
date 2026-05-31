import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:memory_map/components/cemeteries/bloc/cemeteries_bloc.dart';

class CemeteriesBlocProvider extends StatelessWidget {
  const CemeteriesBlocProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<CemeteriesBloc>()
        ..add(const CemeteriesEvent.loadCemeteries()),
      child: child,
    );
  }
}

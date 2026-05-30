import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/graves/bloc/graves_bloc.dart';
import 'package:memory_map/shared/di/injection.dart';

class GravesBlocProvider extends StatelessWidget {
  const GravesBlocProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GravesBloc>()..add(const GravesEvent.loadGraves()),
      child: child,
    );
  }
}

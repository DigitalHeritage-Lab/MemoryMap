import 'package:empty_template/components/digitize/bloc/digitize_bloc.dart';
import 'package:empty_template/shared/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DigitizeBlocProvider extends StatelessWidget {
  const DigitizeBlocProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DigitizeBloc>()
        ..add(const DigitizeEvent.loadRegions()),
      child: child,
    );
  }
}

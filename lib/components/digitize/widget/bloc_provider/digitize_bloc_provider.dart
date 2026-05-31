import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';

class DigitizeBlocProvider extends StatelessWidget {
  const DigitizeBlocProvider({
    required this.child,
    this.initialImagePath,
    super.key,
  });

  final Widget child;
  final String? initialImagePath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = GetIt.I.get<DigitizeBloc>()
          ..add(const DigitizeEvent.loadRegions());
        if (initialImagePath != null) {
          bloc.add(DigitizeEvent.recognizeTextFromImage(initialImagePath!));
        }
        return bloc;
      },
      child: child,
    );
  }
}

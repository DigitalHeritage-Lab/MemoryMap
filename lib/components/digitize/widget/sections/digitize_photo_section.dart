import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';
import 'package:memory_map/shared/shared.dart';

class DigitizePhotoSection extends StatelessWidget {
  const DigitizePhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitizeBloc, DigitizeState>(
      buildWhen: (prev, curr) =>
          prev.photoUrl != curr.photoUrl || prev.photoPath != curr.photoPath,
      builder: (context, state) {
        if (state.photoUrl != null && state.photoUrl!.isNotEmpty) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.m),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: state.photoUrl!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else if (state.photoPath != null) {
          return Padding(
            padding: EdgeInsets.only(bottom: AppSpacing.m),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(state.photoPath!),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

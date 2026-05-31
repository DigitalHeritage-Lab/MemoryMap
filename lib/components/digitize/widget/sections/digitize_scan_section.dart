import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class DigitizeScanSection extends StatelessWidget {
  const DigitizeScanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitizeBloc, DigitizeState>(
      buildWhen: (prev, curr) =>
          prev.ocrStatus != curr.ocrStatus || prev.status != curr.status,
      builder: (context, state) {
        final isReadOnly = state.status == LoadingStatus.loading;

        return AppButton(
          onPressed: isReadOnly
              ? null
              : () {
                  context.read<DigitizeBloc>().add(
                        const DigitizeEvent.pickImageAndRecognize(),
                      );
                },
          text: context.l10n.scanTextOcr,
          icon: Icons.document_scanner,
          isLoading: state.ocrStatus == OcrStatus.loading,
          backgroundColor: AppColors.slate700,
          textColor: AppColors.slate50,
        );
      },
    );
  }
}

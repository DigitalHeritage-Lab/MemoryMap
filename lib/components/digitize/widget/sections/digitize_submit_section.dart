import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class DigitizeSubmitSection extends StatelessWidget {
  const DigitizeSubmitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitizeBloc, DigitizeState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status || prev.errorMessage != curr.errorMessage,
      builder: (context, state) {
        final isReadOnly = state.status == LoadingStatus.loading;

        return Column(
          children: [
            // Error feedback or status messages
            SendingTextWidget(
              status: state.status,
              errorText: state.errorMessage == 'fillAllRequiredFields'
                  ? context.l10n.fillAllRequiredFields
                  : state.errorMessage.toLocalizedError(context) ??
                      state.errorMessage,
            ),
            SizedBox(height: AppSpacing.xs),

            // Submit button
            AppButton(
              onPressed: isReadOnly
                  ? null
                  : () => context.read<DigitizeBloc>().add(
                        const DigitizeEvent.submitGrave(),
                      ),
              text: context.l10n.addGrave,
              isLoading: state.status == LoadingStatus.loading,
            ),
            SizedBox(height: AppSpacing.xxxl),
          ],
        );
      },
    );
  }
}

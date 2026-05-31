import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class DigitizeGpsSection extends StatelessWidget {
  const DigitizeGpsSection({
    required this.gpsController,
    super.key,
  });

  final TextEditingController gpsController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DigitizeBloc, DigitizeState>(
      listenWhen: (prev, curr) =>
          prev.latitude != curr.latitude || prev.longitude != curr.longitude,
      listener: (context, state) {
        if (state.latitude != null && state.longitude != null) {
          gpsController.text = '${state.latitude!.toStringAsFixed(6)}, '
              '${state.longitude!.toStringAsFixed(6)}';
        } else {
          gpsController.clear();
        }
      },
      buildWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.gpsStatus != curr.gpsStatus ||
          prev.showErrors != curr.showErrors ||
          prev.gpsError != curr.gpsError,
      builder: (context, state) {
        final isReadOnly = state.status == LoadingStatus.loading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.gpsLocationLabel,
              style: AppTextStyles.label.copyWith(
                color: AppColors.slate400,
              ),
            ),
            SizedBox(height: AppSpacing.xs),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFieldWidget(
                    controller: gpsController,
                    labelText: '',
                    hintText: context.l10n.coordinatesNotDetermined,
                    readOnly: true,
                    showErrorText: state.showErrors && state.gpsError != null,
                    errorText: state.gpsError.toLocalizedError(context) ?? '',
                    prefixIcon: const Icon(
                      Icons.gps_fixed,
                      size: 18,
                      color: AppColors.slate500,
                    ),
                  ),
                ),
                SizedBox(width: AppSpacing.s),
                AppButton(
                  onPressed: isReadOnly
                      ? null
                      : () => context.read<DigitizeBloc>().add(
                            const DigitizeEvent.getCurrentGps(),
                          ),
                  text: context.l10n.determine,
                  icon: Icons.my_location,
                  isLoading: state.gpsStatus == GpsStatus.loading,
                  padding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: AppSpacing.xl,
                  ),
                  width: null,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.xxl),
          ],
        );
      },
    );
  }
}

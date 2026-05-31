import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class DigitizePersonalInfoSection extends StatelessWidget {
  const DigitizePersonalInfoSection({
    required this.nameController,
    required this.birthDateController,
    required this.deathDateController,
    required this.bioController,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController birthDateController;
  final TextEditingController deathDateController;
  final TextEditingController bioController;

  Future<void> _pickDate({
    required BuildContext context,
    required bool isBirth,
  }) async {
    final formatted =
        await DatePickerHelper.pickDateFormatted(context: context);
    if (formatted == null || !context.mounted) return;

    if (isBirth) {
      context
          .read<DigitizeBloc>()
          .add(DigitizeEvent.birthDateChanged(formatted));
    } else {
      context
          .read<DigitizeBloc>()
          .add(DigitizeEvent.deathDateChanged(formatted));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitizeBloc, DigitizeState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.showErrors != curr.showErrors ||
          prev.nameError != curr.nameError ||
          prev.birthDateError != curr.birthDateError ||
          prev.deathDateError != curr.deathDateError,
      builder: (context, state) {
        final isReadOnly = state.status == LoadingStatus.loading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full name
            TextFieldWidget(
              controller: nameController,
              labelText: context.l10n.fullName,
              hintText: context.l10n.fullNameHint,
              readOnly: isReadOnly,
              showErrorText: state.showErrors && state.nameError != null,
              errorText: state.nameError.toLocalizedError(context) ?? '',
              onChanged: (val) => context
                  .read<DigitizeBloc>()
                  .add(DigitizeEvent.fullNameChanged(val)),
            ),
            SizedBox(height: AppSpacing.m),

            // Dates row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFieldWidget(
                    controller: birthDateController,
                    labelText: context.l10n.birthDate,
                    hintText: context.l10n.dateFormatHint,
                    readOnly: true,
                    showErrorText:
                        state.showErrors && state.birthDateError != null,
                    errorText:
                        state.birthDateError.toLocalizedError(context) ?? '',
                    suffixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      size: 18,
                      color: AppColors.slate500,
                    ),
                    onTap: isReadOnly
                        ? null
                        : () => _pickDate(
                              context: context,
                              isBirth: true,
                            ),
                  ),
                ),
                SizedBox(width: AppSpacing.m),
                Expanded(
                  child: TextFieldWidget(
                    controller: deathDateController,
                    labelText: context.l10n.deathDate,
                    hintText: context.l10n.dateFormatHint,
                    readOnly: true,
                    showErrorText:
                        state.showErrors && state.deathDateError != null,
                    errorText:
                        state.deathDateError.toLocalizedError(context) ?? '',
                    suffixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      size: 18,
                      color: AppColors.slate500,
                    ),
                    onTap: isReadOnly
                        ? null
                        : () => _pickDate(
                              context: context,
                              isBirth: false,
                            ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.m),

            // Biography / Epitaph
            TextFieldWidget(
              controller: bioController,
              labelText: context.l10n.bio,
              hintText: context.l10n.bioHint,
              readOnly: isReadOnly,
              maxLines: 4,
              textInputAction: TextInputAction.done,
              onChanged: (val) => context
                  .read<DigitizeBloc>()
                  .add(DigitizeEvent.bioChanged(val)),
            ),
            SizedBox(height: AppSpacing.m),
          ],
        );
      },
    );
  }
}

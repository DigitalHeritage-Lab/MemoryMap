import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';
import 'package:memory_map/components/digitize/widget/sections/digitize_gps_section.dart';
import 'package:memory_map/components/digitize/widget/sections/digitize_location_section.dart';
import 'package:memory_map/components/digitize/widget/sections/digitize_personal_info_section.dart';
import 'package:memory_map/components/digitize/widget/sections/digitize_photo_section.dart';
import 'package:memory_map/components/digitize/widget/sections/digitize_scan_section.dart';
import 'package:memory_map/components/digitize/widget/sections/digitize_submit_section.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class DigitizeBody extends StatefulWidget {
  const DigitizeBody({super.key});

  @override
  State<DigitizeBody> createState() => _DigitizeBodyState();
}

class _DigitizeBodyState extends State<DigitizeBody> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _deathDateController = TextEditingController();
  final _gpsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _birthDateController.dispose();
    _deathDateController.dispose();
    _gpsController.dispose();
    super.dispose();
  }

  void _clearForm(BuildContext context) {
    _nameController.clear();
    _bioController.clear();
    _birthDateController.clear();
    _deathDateController.clear();
    _gpsController.clear();
    context.read<DigitizeBloc>().add(const DigitizeEvent.resetForm());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DigitizeBloc, DigitizeState>(
          listenWhen: (prev, curr) =>
              prev.status != curr.status ||
              prev.latitude != curr.latitude ||
              prev.longitude != curr.longitude ||
              prev.fullName != curr.fullName ||
              prev.birthDate != curr.birthDate ||
              prev.deathDate != curr.deathDate,
          listener: (context, state) {
            if (state.status == LoadingStatus.loaded) {
              final cemeteryId = state.selectedCemetery?.id;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.l10n.saveSuccess),
                  backgroundColor: AppColors.emerald,
                ),
              );
              _clearForm(context);
              if (cemeteryId != null) {
                context.go('/cemeteries/$cemeteryId');
              }
            }

            // Sync fields from state (needed after OCR or resetForm)
            if (state.fullName != _nameController.text) {
              _nameController.text = state.fullName;
            }
            if (state.birthDate != _birthDateController.text) {
              _birthDateController.text = state.birthDate;
            }
            if (state.deathDate != _deathDateController.text) {
              _deathDateController.text = state.deathDate;
            }
          },
        ),
        BlocListener<DigitizeBloc, DigitizeState>(
          listenWhen: (prev, curr) => prev.ocrStatus != curr.ocrStatus,
          listener: (context, state) {
            if (state.ocrStatus == OcrStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage.toLocalizedError(context) ??
                        state.errorMessage ??
                        context.l10n.defaultError,
                  ),
                  backgroundColor: AppColors.red,
                ),
              );
            } else if (state.ocrStatus == OcrStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(context.l10n.ocrSuccessMessage),
                  backgroundColor: AppColors.emerald,
                ),
              );
            }
          },
        ),
      ],
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DigitizeScanSection(),
            SizedBox(height: AppSpacing.m),
            BlocBuilder<DigitizeBloc, DigitizeState>(
              buildWhen: (prev, curr) => prev.ocrStatus != curr.ocrStatus,
              builder: (context, state) {
                final showForm = state.ocrStatus == OcrStatus.success ||
                    state.ocrStatus == OcrStatus.error;

                if (!showForm) {
                  return const SizedBox.shrink();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DigitizePhotoSection(),
                    DigitizePersonalInfoSection(
                      nameController: _nameController,
                      birthDateController: _birthDateController,
                      deathDateController: _deathDateController,
                      bioController: _bioController,
                    ),
                    const DigitizeLocationSection(),
                    DigitizeGpsSection(
                      gpsController: _gpsController,
                    ),
                    const DigitizeSubmitSection(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

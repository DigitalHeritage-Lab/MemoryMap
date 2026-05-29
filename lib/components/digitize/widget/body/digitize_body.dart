import 'package:empty_template/components/digitize/bloc/digitize_bloc.dart';
import 'package:empty_template/components/digitize/widget/add_cemetery_dialog.dart';
import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DigitizeBody extends StatefulWidget {
  const DigitizeBody({super.key});

  @override
  State<DigitizeBody> createState() => _DigitizeBodyState();
}

class _DigitizeBodyState extends State<DigitizeBody> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({
    required BuildContext context,
    required bool isBirth,
  }) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 50),
      firstDate: DateTime(1700),
      lastDate: now,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.emerald,
            surface: AppColors.slate800,
            onSurface: AppColors.slate50,
          ),
        ),
        child: child!,
      ),
    );
    if (picked == null || !context.mounted) return;
    final formatted = DateFormat('yyyy-MM-dd').format(picked);
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

  void _clearForm(BuildContext context) {
    _nameController.clear();
    _bioController.clear();
    context.read<DigitizeBloc>().add(const DigitizeEvent.resetForm());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DigitizeBloc, DigitizeState>(
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
      },
      builder: (context, state) {
        final isReadOnly = state.status == LoadingStatus.loading;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full name
              TextFieldWidget(
                controller: _nameController,
                labelText: context.l10n.fullName,
                hintText: context.l10n.fullNameHint,
                readOnly: isReadOnly,
                showErrorText: state.showErrors && state.nameError != null,
                errorText: _getLocalizedError(context, state.nameError) ?? '',
                onChanged: (val) => context
                    .read<DigitizeBloc>()
                    .add(DigitizeEvent.fullNameChanged(val)),
              ),
              const SizedBox(height: 18),

              // 1. Region selection
              Text(
                context.l10n.region,
                style: const TextStyle(
                  color: AppColors.slate400,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: isReadOnly ? AppColors.slate900 : AppColors.slate800,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.slate700),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Region>(
                    value: state.selectedRegion,
                    hint: Text(
                      context.l10n.selectRegion,
                      style: const TextStyle(
                        color: AppColors.slate600,
                        fontSize: 16,
                      ),
                    ),
                    dropdownColor: AppColors.slate800,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.slate500,
                    ),
                    isExpanded: true,
                    style: const TextStyle(
                      color: AppColors.slate50,
                      fontSize: 16,
                    ),
                    onChanged: isReadOnly
                        ? null
                        : (Region? region) {
                            context.read<DigitizeBloc>().add(
                                  DigitizeEvent.regionChanged(region),
                                );
                          },
                    items: state.regions.map((Region r) {
                      return DropdownMenuItem<Region>(
                        value: r,
                        child: Text(r.name),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // 2. District selection
              Text(
                context.l10n.district,
                style: const TextStyle(
                  color: AppColors.slate400,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: (isReadOnly || state.selectedRegion == null)
                      ? AppColors.slate900
                      : AppColors.slate800,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: (isReadOnly || state.selectedRegion == null)
                        ? AppColors.slate800
                        : AppColors.slate700,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<District>(
                    value: state.selectedDistrict,
                    hint: Text(
                      context.l10n.selectDistrict,
                      style: const TextStyle(
                        color: AppColors.slate600,
                        fontSize: 16,
                      ),
                    ),
                    dropdownColor: AppColors.slate800,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.slate500,
                    ),
                    isExpanded: true,
                    style: const TextStyle(
                      color: AppColors.slate50,
                      fontSize: 16,
                    ),
                    onChanged: (isReadOnly || state.selectedRegion == null)
                        ? null
                        : (District? district) {
                            context.read<DigitizeBloc>().add(
                                  DigitizeEvent.districtChanged(district),
                                );
                          },
                    items: state.districts.map((District d) {
                      return DropdownMenuItem<District>(
                        value: d,
                        child: Text(d.name),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // 3. Settlement selection
              Text(
                context.l10n.settlement,
                style: const TextStyle(
                  color: AppColors.slate400,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: (isReadOnly || state.selectedDistrict == null)
                      ? AppColors.slate900
                      : AppColors.slate800,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: (isReadOnly || state.selectedDistrict == null)
                        ? AppColors.slate800
                        : AppColors.slate700,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Settlement>(
                    value: state.selectedSettlement,
                    hint: Text(
                      context.l10n.selectSettlement,
                      style: const TextStyle(
                        color: AppColors.slate600,
                        fontSize: 16,
                      ),
                    ),
                    dropdownColor: AppColors.slate800,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.slate500,
                    ),
                    isExpanded: true,
                    style: const TextStyle(
                      color: AppColors.slate50,
                      fontSize: 16,
                    ),
                    onChanged: (isReadOnly || state.selectedDistrict == null)
                        ? null
                        : (Settlement? settlement) {
                            context.read<DigitizeBloc>().add(
                                  DigitizeEvent.settlementChanged(settlement),
                                );
                          },
                    items: state.settlements.map((Settlement s) {
                      return DropdownMenuItem<Settlement>(
                        value: s,
                        child: Text('${s.type} ${s.name}'),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // 4. Cemetery selection
              Text(
                context.l10n.cemeteryLabel,
                style: const TextStyle(
                  color: AppColors.slate400,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: (isReadOnly || state.selectedSettlement == null)
                      ? AppColors.slate900
                      : AppColors.slate800,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: (state.showErrors && state.cemeteryError != null)
                        ? AppColors.red
                        : ((isReadOnly || state.selectedSettlement == null)
                            ? AppColors.slate800
                            : AppColors.slate700),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Cemetery>(
                    value: state.selectedCemetery,
                    hint: Text(
                      state.cemeteries.isEmpty &&
                              state.selectedSettlement != null
                          ? context.l10n.noCemeteriesInSettlement
                          : context.l10n.selectCemetery,
                      style: const TextStyle(
                        color: AppColors.slate600,
                        fontSize: 16,
                      ),
                    ),
                    dropdownColor: AppColors.slate800,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.slate500,
                    ),
                    isExpanded: true,
                    style: const TextStyle(
                      color: AppColors.slate50,
                      fontSize: 16,
                    ),
                    onChanged: (isReadOnly || state.selectedSettlement == null)
                        ? null
                        : (Cemetery? cemetery) {
                            context.read<DigitizeBloc>().add(
                                  DigitizeEvent.cemeterySelected(cemetery),
                                );
                          },
                    items: state.cemeteries.map((Cemetery c) {
                      return DropdownMenuItem<Cemetery>(
                        value: c,
                        child: Text(c.name),
                      );
                    }).toList(),
                  ),
                ),
              ),
              if (state.showErrors && state.cemeteryError != null) ...[
                const SizedBox(height: 6),
                Text(
                  _getLocalizedError(context, state.cemeteryError) ?? '',
                  style: const TextStyle(color: AppColors.red, fontSize: 12),
                ),
              ],
              if (state.selectedSettlement != null) ...[
                const SizedBox(height: 10),
                AppButton(
                  onPressed: isReadOnly
                      ? null
                      : () async {
                          await AddCemeteryDialog.show(
                            context,
                            context.read<DigitizeBloc>(),
                          );
                        },
                  text: context.l10n.addCemetery,
                  icon: Icons.add,
                  backgroundColor: AppColors.slate700,
                  textColor: AppColors.slate50,
                ),
              ],
              const SizedBox(height: 18),

              // Dates row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _DatePickerField(
                      label: context.l10n.birthDate,
                      value: state.birthDate,
                      hasError:
                          state.showErrors && state.birthDateError != null,
                      errorText: _getLocalizedError(
                            context,
                            state.birthDateError,
                          ) ??
                          '',
                      enabled: !isReadOnly,
                      onTap: () => _pickDate(
                        context: context,
                        isBirth: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _DatePickerField(
                      label: context.l10n.deathDate,
                      value: state.deathDate,
                      hasError:
                          state.showErrors && state.deathDateError != null,
                      errorText: _getLocalizedError(
                            context,
                            state.deathDateError,
                          ) ??
                          '',
                      enabled: !isReadOnly,
                      onTap: () => _pickDate(
                        context: context,
                        isBirth: false,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Biography / Epitaph
              TextFieldWidget(
                controller: _bioController,
                labelText: context.l10n.bio,
                hintText: context.l10n.bioHint,
                readOnly: isReadOnly,
                maxLines: 4,
                onChanged: (val) => context
                    .read<DigitizeBloc>()
                    .add(DigitizeEvent.bioChanged(val)),
              ),
              const SizedBox(height: 18),

              // GPS block
              Text(
                context.l10n.gpsLocationLabel,
                style: const TextStyle(
                  color: AppColors.slate400,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.slate900,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: (state.showErrors && state.gpsError != null)
                              ? AppColors.red
                              : AppColors.slate700,
                        ),
                      ),
                      child: Text(
                        state.latitude != null && state.longitude != null
                            ? '${state.latitude!.toStringAsFixed(6)}, '
                                '${state.longitude!.toStringAsFixed(6)}'
                            : context.l10n.coordinatesNotDetermined,
                        style: TextStyle(
                          color: state.latitude != null
                              ? AppColors.slate50
                              : AppColors.slate600,
                          fontSize: 15,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  AppButton(
                    onPressed: isReadOnly
                        ? null
                        : () => context.read<DigitizeBloc>().add(
                              const DigitizeEvent.getCurrentGps(),
                            ),
                    text: context.l10n.determine,
                    icon: Icons.gps_fixed,
                    isLoading: state.gpsStatus == GpsStatus.loading,
                    width: null,
                  ),
                ],
              ),
              if (state.showErrors && state.gpsError != null) ...[
                const SizedBox(height: 6),
                Text(
                  _getLocalizedError(context, state.gpsError) ?? '',
                  style: const TextStyle(color: AppColors.red, fontSize: 12),
                ),
              ],
              const SizedBox(height: 32),

              // Error feedback or status messages
              SendingTextWidget(
                status: state.status,
                errorText: state.errorMessage == 'fillAllRequiredFields'
                    ? context.l10n.fillAllRequiredFields
                    : state.errorMessage,
              ),
              const SizedBox(height: 8),

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
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}

/// Compact date picker field that shows selected value
/// and opens [showDatePicker] on tap.
class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.value,
    required this.hasError,
    required this.errorText,
    required this.enabled,
    required this.onTap,
  });

  final String label;
  final String value;
  final bool hasError;
  final String errorText;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final hasValue = value.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.slate400,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: enabled ? onTap : null,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: enabled ? AppColors.slate800 : AppColors.slate900,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: hasError ? AppColors.red : AppColors.slate700,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    hasValue ? value : 'рррр-мм-дд',
                    style: TextStyle(
                      color: hasValue ? AppColors.slate50 : AppColors.slate600,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: AppColors.slate500,
                ),
              ],
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            errorText,
            style: const TextStyle(
              color: AppColors.red,
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }
}

String? _getLocalizedError(BuildContext context, String? errorCode) {
  if (errorCode == null) return null;
  switch (errorCode) {
    case 'requiredField':
      return context.l10n.requiredField;
    case 'fullNameTooShort':
      return context.l10n.fullNameTooShort;
    case 'invalidDate':
      return context.l10n.invalidDate;
    case 'invalidDateRange':
      return context.l10n.invalidDateRange;
    case 'dateInFuture':
      return context.l10n.dateInFuture;
    case 'invalidLifespan':
      return context.l10n.invalidLifespan;
    case 'coordinatesTooFar':
      return context.l10n.coordinatesTooFar;
    default:
      return null;
  }
}

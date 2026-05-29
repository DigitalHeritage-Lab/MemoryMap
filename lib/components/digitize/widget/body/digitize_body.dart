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
    _birthDateController.clear();
    _deathDateController.clear();
    _gpsController.clear();
    context.read<DigitizeBloc>().add(const DigitizeEvent.resetForm());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DigitizeBloc, DigitizeState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.latitude != curr.latitude ||
          prev.longitude != curr.longitude ||
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
        // Sync GPS display field
        if (state.latitude != null && state.longitude != null) {
          _gpsController.text = '${state.latitude!.toStringAsFixed(6)}, '
              '${state.longitude!.toStringAsFixed(6)}';
        }
        // Sync date fields from state (needed after resetForm)
        if (state.birthDate != _birthDateController.text) {
          _birthDateController.text = state.birthDate;
        }
        if (state.deathDate != _deathDateController.text) {
          _deathDateController.text = state.deathDate;
        }
      },
      child: BlocBuilder<DigitizeBloc, DigitizeState>(
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
                  errorText: state.nameError.toLocalizedError(context) ?? '',
                  onChanged: (val) => context
                      .read<DigitizeBloc>()
                      .add(DigitizeEvent.fullNameChanged(val)),
                ),
                const SizedBox(height: 18),

                // 1. Region selection
                _AdminDropdown<Region>(
                  label: context.l10n.region,
                  hint: context.l10n.selectRegion,
                  value: state.selectedRegion,
                  items: state.regions,
                  isEnabled: !isReadOnly,
                  itemLabel: (r) => r.name,
                  onChanged: (r) => context
                      .read<DigitizeBloc>()
                      .add(DigitizeEvent.regionChanged(r)),
                ),
                const SizedBox(height: 18),

                // 2. District selection
                _AdminDropdown<District>(
                  label: context.l10n.district,
                  hint: context.l10n.selectDistrict,
                  value: state.selectedDistrict,
                  items: state.districts,
                  isEnabled: !isReadOnly && state.selectedRegion != null,
                  itemLabel: (d) => d.name,
                  onChanged: (d) => context
                      .read<DigitizeBloc>()
                      .add(DigitizeEvent.districtChanged(d)),
                ),
                const SizedBox(height: 18),

                // 3. Settlement selection
                _AdminDropdown<Settlement>(
                  label: context.l10n.settlement,
                  hint: context.l10n.selectSettlement,
                  value: state.selectedSettlement,
                  items: state.settlements,
                  isEnabled: !isReadOnly && state.selectedDistrict != null,
                  itemLabel: (s) => '${s.type} ${s.name}',
                  onChanged: (s) => context
                      .read<DigitizeBloc>()
                      .add(DigitizeEvent.settlementChanged(s)),
                ),
                const SizedBox(height: 18),

                // 4. Cemetery selection
                _AdminDropdown<Cemetery>(
                  label: context.l10n.cemeteryLabel,
                  hint: state.cemeteries.isEmpty &&
                          state.selectedSettlement != null
                      ? context.l10n.noCemeteriesInSettlement
                      : context.l10n.selectCemetery,
                  value: state.selectedCemetery,
                  items: state.cemeteries,
                  isEnabled: !isReadOnly && state.selectedSettlement != null,
                  hasError: state.showErrors && state.cemeteryError != null,
                  itemLabel: (c) => c.name,
                  onChanged: (c) => context
                      .read<DigitizeBloc>()
                      .add(DigitizeEvent.cemeterySelected(c)),
                ),
                if (state.showErrors && state.cemeteryError != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    state.cemeteryError.toLocalizedError(context) ?? '',
                    style: const TextStyle(
                      color: AppColors.red,
                      fontSize: 12,
                    ),
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
                      child: TextFieldWidget(
                        controller: _birthDateController,
                        labelText: context.l10n.birthDate,
                        hintText: 'рррр-мм-дд',
                        readOnly: true,
                        showErrorText:
                            state.showErrors && state.birthDateError != null,
                        errorText:
                            state.birthDateError.toLocalizedError(context) ??
                                '',
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
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFieldWidget(
                        controller: _deathDateController,
                        labelText: context.l10n.deathDate,
                        hintText: 'рррр-мм-дд',
                        readOnly: true,
                        showErrorText:
                            state.showErrors && state.deathDateError != null,
                        errorText:
                            state.deathDateError.toLocalizedError(context) ??
                                '',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFieldWidget(
                        controller: _gpsController,
                        labelText: '',
                        hintText: context.l10n.coordinatesNotDetermined,
                        readOnly: true,
                        showErrorText:
                            state.showErrors && state.gpsError != null,
                        errorText:
                            state.gpsError.toLocalizedError(context) ?? '',
                        prefixIcon: const Icon(
                          Icons.gps_fixed,
                          size: 18,
                          color: AppColors.slate500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: AppButton(
                        onPressed: isReadOnly
                            ? null
                            : () => context.read<DigitizeBloc>().add(
                                  const DigitizeEvent.getCurrentGps(),
                                ),
                        text: context.l10n.determine,
                        icon: Icons.my_location,
                        isLoading: state.gpsStatus == GpsStatus.loading,
                        width: null,
                      ),
                    ),
                  ],
                ),
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
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private reusable dropdown widget for administrative divisions
// ---------------------------------------------------------------------------

class _AdminDropdown<T> extends StatelessWidget {
  const _AdminDropdown({
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.isEnabled,
    required this.itemLabel,
    required this.onChanged,
    this.hasError = false,
    super.key,
  });

  final String label;
  final String hint;
  final T? value;
  final List<T> items;
  final bool isEnabled;
  final bool hasError;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: isEnabled ? AppColors.slate800 : AppColors.slate900,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: hasError
                  ? AppColors.red
                  : (isEnabled ? AppColors.slate700 : AppColors.slate800),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              hint: Text(
                hint,
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
              onChanged: isEnabled ? onChanged : null,
              items: items
                  .map(
                    (item) => DropdownMenuItem<T>(
                      value: item,
                      child: Text(itemLabel(item)),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

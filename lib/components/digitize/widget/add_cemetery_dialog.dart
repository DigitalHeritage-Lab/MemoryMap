import 'package:empty_template/components/digitize/bloc/digitize_bloc.dart';
import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCemeteryDialog extends StatefulWidget {
  const AddCemeteryDialog({required this.bloc, super.key});

  final DigitizeBloc bloc;

  static Future<void> show(BuildContext context, DigitizeBloc bloc) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AddCemeteryDialog(bloc: bloc),
    );
  }

  @override
  State<AddCemeteryDialog> createState() => _AddCemeteryDialogState();
}

class _AddCemeteryDialogState extends State<AddCemeteryDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  bool _showErrors = false;

  @override
  void initState() {
    super.initState();
    final state = widget.bloc.state;
    if (state.latitude != null) {
      _latController.text = state.latitude!.toStringAsFixed(6);
    }
    if (state.longitude != null) {
      _lngController.text = state.longitude!.toStringAsFixed(6);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _latController.dispose();
    _lngController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() => _showErrors = true);

    final name = _nameController.text.trim();
    final location = _locationController.text.trim();
    final description = _descriptionController.text.trim();
    final lat = double.tryParse(_latController.text);
    final lng = double.tryParse(_lngController.text);

    if (name.isEmpty || location.isEmpty || lat == null || lng == null) {
      return;
    }

    widget.bloc.add(
      DigitizeEvent.createCemetery(
        name: name,
        location: location,
        description: description,
        latitude: lat,
        longitude: lng,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.bloc.state;
    final parentContext = context;

    return BlocListener<DigitizeBloc, DigitizeState>(
      bloc: widget.bloc,
      listenWhen: (previous, current) =>
          previous.cemeteryCreationStatus != current.cemeteryCreationStatus ||
          previous.latitude != current.latitude ||
          previous.longitude != current.longitude,
      listener: (context, state) {
        if (state.cemeteryCreationStatus == LoadingStatus.loaded) {
          ScaffoldMessenger.of(parentContext).showSnackBar(
            SnackBar(
              content: Text(parentContext.l10n.cemeteryCreatedSuccess),
              backgroundColor: AppColors.emerald,
            ),
          );
          Navigator.of(parentContext).pop();
        }
        if (state.latitude != null && state.longitude != null) {
          _latController.text = state.latitude!.toStringAsFixed(6);
          _lngController.text = state.longitude!.toStringAsFixed(6);
        }
      },
      child: Dialog(
        backgroundColor: AppColors.slate800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.slate700),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.addCemetery,
                        style: const TextStyle(
                          color: AppColors.slate50,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.slate400,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Pre-filled read-only administration data
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.emerald,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          '${state.selectedRegion?.name} • '
                          '${state.selectedDistrict?.name} • '
                          '${state.selectedSettlement?.name}',
                          style: const TextStyle(
                            color: AppColors.slate400,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.slate700, height: 24),

                  // Name
                  TextFieldWidget(
                    controller: _nameController,
                    labelText: context.l10n.cemeteryName,
                    hintText: context.l10n.cemeteryNameHint,
                    readOnly:
                        state.cemeteryCreationStatus == LoadingStatus.loading,
                    showErrorText:
                        _showErrors && _nameController.text.trim().isEmpty,
                    errorText: context.l10n.requiredField,
                  ),
                  const SizedBox(height: 16),

                  // Address / Location description
                  TextFieldWidget(
                    controller: _locationController,
                    labelText: context.l10n.cemeteryLabel,
                    hintText: context.l10n.cemeteryAddressHint,
                    readOnly:
                        state.cemeteryCreationStatus == LoadingStatus.loading,
                    showErrorText:
                        _showErrors && _locationController.text.trim().isEmpty,
                    errorText: context.l10n.requiredField,
                  ),
                  const SizedBox(height: 16),

                  // Description
                  TextFieldWidget(
                    controller: _descriptionController,
                    labelText: context.l10n.cemeteryDescription,
                    hintText: context.l10n.cemeteryDescriptionHint,
                    readOnly:
                        state.cemeteryCreationStatus == LoadingStatus.loading,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Coordinates
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: _latController,
                          labelText: context.l10n.latitude,
                          hintText: '50.4162',
                          readOnly: state.cemeteryCreationStatus ==
                              LoadingStatus.loading,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          showErrorText: _showErrors &&
                              double.tryParse(_latController.text) == null,
                          errorText: context.l10n.requiredField,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFieldWidget(
                          controller: _lngController,
                          labelText: context.l10n.longitude,
                          hintText: '30.5097',
                          readOnly: state.cemeteryCreationStatus ==
                              LoadingStatus.loading,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          showErrorText: _showErrors &&
                              double.tryParse(_lngController.text) == null,
                          errorText: context.l10n.requiredField,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // GPS button inside dialog
                  AppButton(
                    onPressed: () {
                      widget.bloc.add(const DigitizeEvent.getCurrentGps());
                    },
                    text: context.l10n.determine,
                    icon: Icons.gps_fixed,
                    isLoading: state.gpsStatus == GpsStatus.loading,
                  ),
                  const SizedBox(height: 24),

                  // Errors feedback from Bloc
                  if (state.cemeteryErrorMessage != null) ...[
                    Text(
                      state.cemeteryErrorMessage == 'fillAllRequiredFields'
                          ? context.l10n.fillAllRequiredFields
                          : state.cemeteryErrorMessage!,
                      style: const TextStyle(
                        color: AppColors.red,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onPressed: () => Navigator.of(context).pop(),
                          text: context.l10n.cancel,
                          backgroundColor: AppColors.slate700,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AppButton(
                          onPressed: _submit,
                          text: context.l10n.save,
                          isLoading: state.cemeteryCreationStatus ==
                              LoadingStatus.loading,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

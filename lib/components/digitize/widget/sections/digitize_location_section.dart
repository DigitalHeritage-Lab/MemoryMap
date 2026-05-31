import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_map/components/digitize/bloc/digitize_bloc.dart';
import 'package:memory_map/components/digitize/widget/add_cemetery_dialog.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class DigitizeLocationSection extends StatelessWidget {
  const DigitizeLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitizeBloc, DigitizeState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status ||
          prev.showErrors != curr.showErrors ||
          prev.selectedRegion != curr.selectedRegion ||
          prev.selectedDistrict != curr.selectedDistrict ||
          prev.selectedSettlement != curr.selectedSettlement ||
          prev.selectedCemetery != curr.selectedCemetery ||
          prev.regions != curr.regions ||
          prev.districts != curr.districts ||
          prev.settlements != curr.settlements ||
          prev.cemeteries != curr.cemeteries ||
          prev.cemeteryError != curr.cemeteryError,
      builder: (context, state) {
        final isReadOnly = state.status == LoadingStatus.loading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: AppSpacing.m),

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
            SizedBox(height: AppSpacing.m),

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
            SizedBox(height: AppSpacing.m),

            // 4. Cemetery selection
            _AdminDropdown<Cemetery>(
              label: context.l10n.cemeteryLabel,
              hint: state.cemeteries.isEmpty && state.selectedSettlement != null
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
              SizedBox(height: AppSpacing.xs),
              Text(
                state.cemeteryError.toLocalizedError(context) ?? '',
                style: const TextStyle(
                  color: AppColors.red,
                  fontSize: 12,
                ),
              ),
            ],
            if (state.selectedSettlement != null) ...[
              SizedBox(height: AppSpacing.s),
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
            SizedBox(height: AppSpacing.m),
          ],
        );
      },
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
          style: AppTextStyles.label.copyWith(
            color: AppColors.slate400,
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.m),
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
                style: AppTextStyles.body.copyWith(
                  color: AppColors.slate600,
                ),
              ),
              dropdownColor: AppColors.slate800,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.slate500,
              ),
              isExpanded: true,
              style: AppTextStyles.body.copyWith(
                color: AppColors.slate50,
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

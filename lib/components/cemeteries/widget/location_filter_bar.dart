import 'package:empty_template/components/cemeteries/bloc/cemeteries_bloc.dart';
import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationFilterBar extends StatelessWidget {
  const LocationFilterBar({
    required this.onChooseOnMap,
    super.key,
  });

  final VoidCallback onChooseOnMap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CemeteriesBloc, CemeteriesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _FilterChip(
                    label: context.l10n.locationFilterAll,
                    icon: Icons.language,
                    isSelected: state.locationMode == LocationFilterMode.none,
                    onTap: () {
                      context.read<CemeteriesBloc>().add(
                            const CemeteriesEvent.changeLocationMode(
                              LocationFilterMode.none,
                            ),
                          );
                    },
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: context.l10n.locationFilterGps,
                    icon: Icons.my_location,
                    isSelected: state.locationMode == LocationFilterMode.gps,
                    onTap: () {
                      context.read<CemeteriesBloc>().add(
                            const CemeteriesEvent.changeLocationMode(
                              LocationFilterMode.gps,
                            ),
                          );
                    },
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: state.customLocationName ??
                        context.l10n.locationFilterCustom,
                    icon: Icons.map_outlined,
                    isSelected: state.locationMode == LocationFilterMode.custom,
                    onTap: onChooseOnMap,
                  ),
                ],
              ),
            ),
            if (state.gpsError != null)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                child: Text(
                  state.gpsError!,
                  style: const TextStyle(
                    color: AppColors.red,
                    fontSize: 12,
                  ),
                ),
              )
            else if (state.locationMode == LocationFilterMode.gps &&
                state.userLatitude != null)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: AppColors.emerald,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${context.l10n.gpsCoordinates}: '
                      '${state.userLatitude!.toStringAsFixed(4)}, '
                      '${state.userLongitude!.toStringAsFixed(4)}',
                      style: const TextStyle(
                        color: AppColors.slate400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            else if (state.locationMode == LocationFilterMode.custom &&
                state.userLatitude != null)
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.emerald,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${state.userLatitude!.toStringAsFixed(4)}, '
                      '${state.userLongitude!.toStringAsFixed(4)}',
                      style: const TextStyle(
                        color: AppColors.slate400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.deepEmerald : AppColors.slate800,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.emerald : AppColors.slate700,
          width: 1.5,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.emerald.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              // Inside padding rule - ensure whole chip is clickable
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 16,
                    color: isSelected ? Colors.white : AppColors.slate400,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.slate400,
                      fontSize: 14,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
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

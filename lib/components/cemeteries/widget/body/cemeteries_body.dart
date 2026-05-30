import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_map/components/cemeteries/bloc/cemeteries_bloc.dart';
import 'package:memory_map/components/cemeteries/widget/location_filter_bar.dart';
import 'package:memory_map/components/cemeteries/widget/map_location_picker_dialog.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CemeteriesBody extends StatefulWidget {
  const CemeteriesBody({super.key});

  @override
  State<CemeteriesBody> createState() => _CemeteriesBodyState();
}

class _CemeteriesBodyState extends State<CemeteriesBody> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextFieldWidget(
            controller: _searchController,
            labelText: context.l10n.navCemeteries,
            hintText: context.l10n.searchCemeteriesHint,
            prefixIcon: const Icon(Icons.search, color: AppColors.slate500),
            onChanged: (val) {
              context
                  .read<CemeteriesBloc>()
                  .add(CemeteriesEvent.loadCemeteries(query: val));
            },
          ),
        ),
        LocationFilterBar(
          onChooseOnMap: () async {
            final bloc = context.read<CemeteriesBloc>();
            final l10n = context.l10n;
            final result = await MapLocationPickerDialog.show(
              context,
              initialLatitude: bloc.state.userLatitude,
              initialLongitude: bloc.state.userLongitude,
            );
            if (result != null) {
              bloc.add(
                CemeteriesEvent.changeLocationMode(
                  LocationFilterMode.custom,
                  latitude: result.latitude,
                  longitude: result.longitude,
                  name: l10n.mapLocationLabel(
                    result.latitude.toStringAsFixed(2),
                    result.longitude.toStringAsFixed(2),
                  ),
                ),
              );
            }
          },
        ),
        const SizedBox(height: 12),
        Expanded(
          child: BlocBuilder<CemeteriesBloc, CemeteriesState>(
            builder: (context, state) {
              if (state.status == LoadingStatus.error) {
                return TryAgainWidget(
                  message: state.errorMessage,
                  onRetry: () {
                    context.read<CemeteriesBloc>().add(
                          CemeteriesEvent.loadCemeteries(
                            query: _searchController.text,
                          ),
                        );
                  },
                );
              }

              final isLoading = state.status == LoadingStatus.loading;
              final list = (isLoading && state.cemeteries.isEmpty)
                  ? _mockCemeteries
                  : state.cemeteries;

              if (state.status == LoadingStatus.loaded && list.isEmpty) {
                return Center(
                  child: Text(
                    context.l10n.emptyCemeteries,
                    style: const TextStyle(color: AppColors.slate400),
                  ),
                );
              }

              return Skeletonizer(
                enabled: isLoading,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final cemetery = list[index];
                    return _CemeteryCard(
                      cemetery: cemetery,
                      isLoading: isLoading,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  static const List<Cemetery> _mockCemeteries = [
    Cemetery(
      id: 'mock-1',
      name: 'Байкове кладовище',
      location: 'Київ, вул. Байкова, 6',
      description: 'Один із найстаріших та найпрестижніших некрополів Києва.',
      latitude: 50.4162,
      longitude: 30.5097,
      photoUrl: '',
    ),
  ];
}

// ---------------------------------------------------------------------------
// Private stateless card widget — keeps the itemBuilder lean
// ---------------------------------------------------------------------------

class _CemeteryCard extends StatelessWidget {
  const _CemeteryCard({
    required this.cemetery,
    required this.isLoading,
  });

  final Cemetery cemetery;
  final bool isLoading;

  /// Formats raw km distance into a display string.
  String _distanceStr(double km) {
    if (km >= 1.0) return km.toStringAsFixed(1);
    return (km * 1000).toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    final distance = cemetery.distanceKm;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.slate800,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slate700),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading
                ? null
                : () => context.go('/cemeteries/${cemetery.id}'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppNetworkImage(
                  imageUrl: cemetery.photoUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.slate700,
                  ),
                  errorWidget: (context, url, error) => const ColoredBox(
                    color: AppColors.slate700,
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      color: Colors.white24,
                      size: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cemetery.name,
                        style: const TextStyle(
                          color: AppColors.slate50,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppColors.emerald,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              cemetery.location,
                              style: const TextStyle(
                                color: AppColors.slate400,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (distance != null) ...[
                            const SizedBox(width: 8),
                            _DistanceBadge(
                              distance: distance,
                              distanceStr: _distanceStr(distance),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cemetery.description,
                        style: const TextStyle(
                          color: AppColors.slate500,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Private stateless distance badge
// ---------------------------------------------------------------------------

class _DistanceBadge extends StatelessWidget {
  const _DistanceBadge({
    required this.distance,
    required this.distanceStr,
  });

  final double distance;
  final String distanceStr;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.deepEmerald,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.emerald.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.navigation, size: 10, color: AppColors.emerald),
          const SizedBox(width: 4),
          Text(
            distance >= 1.0
                ? context.l10n.distanceAwayKm(distanceStr)
                : context.l10n.distanceAwayM(distanceStr),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

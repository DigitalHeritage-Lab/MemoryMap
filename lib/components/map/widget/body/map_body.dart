import 'package:empty_template/components/map/bloc/map_bloc.dart';
import 'package:empty_template/components/map/widget/cemetery_preview_card.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart' hide MapEvent;
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class MapBody extends StatefulWidget {
  const MapBody({super.key});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  final MapController _mapController = MapController();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _moveToCemetery(double lat, double lng) {
    _mapController.move(LatLng(lat, lng), 14);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        if (state.status == LoadingStatus.loading ||
            state.status == LoadingStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.emerald),
            ),
          );
        }

        if (state.status == LoadingStatus.error && state.cemeteries.isEmpty) {
          return TryAgainWidget(
            message: state.errorMessage,
            onRetry: () {
              context.read<MapBloc>().add(const MapEvent.loadMarkers());
            },
          );
        }

        final initialCenter = state.cemeteries.isNotEmpty
            ? LatLng(
                state.cemeteries.first.latitude,
                state.cemeteries.first.longitude,
              )
            : const LatLng(50.4501, 30.5234); // Kyiv

        final markers = state.cemeteries.map((cemetery) {
          final isSelected = state.selectedCemetery?.id == cemetery.id;
          return Marker(
            point: LatLng(cemetery.latitude, cemetery.longitude),
            width: 50,
            height: 50,
            child: GestureDetector(
              onTap: () {
                context.read<MapBloc>().add(MapEvent.selectCemetery(cemetery));
                _moveToCemetery(cemetery.latitude, cemetery.longitude);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: (isSelected ? AppColors.emerald : AppColors.slate700)
                      .withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.emerald : AppColors.slate400,
                    width: isSelected ? 3 : 1.5,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: AppColors.emerald.withValues(alpha: 0.4),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.emerald : AppColors.slate800,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.account_balance_outlined,
                      color: isSelected ? Colors.white : AppColors.slate400,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList();

        return Column(
          children: [
            Expanded(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: initialCenter,
                  initialZoom: 11,
                  minZoom: 3,
                  maxZoom: 18,
                  onTap: (_, __) {
                    // Deselect when tapping on empty map area
                    context
                        .read<MapBloc>()
                        .add(const MapEvent.selectCemetery(null));
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
                    subdomains: const ['a', 'b', 'c', 'd'],
                    userAgentPackageName: 'com.digitalheritagelab.memorymap',
                    retinaMode: RetinaMode.isHighDensity(context),
                  ),
                  MarkerLayer(
                    markers: markers,
                  ),
                ],
              ),
            ),
            if (state.selectedCemetery != null)
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: CemeteryPreviewCard(
                  cemetery: state.selectedCemetery!,
                  onClose: () {
                    context
                        .read<MapBloc>()
                        .add(const MapEvent.selectCemetery(null));
                  },
                  onOpenDetails: () {
                    context.go('/cemeteries/${state.selectedCemetery!.id}');
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

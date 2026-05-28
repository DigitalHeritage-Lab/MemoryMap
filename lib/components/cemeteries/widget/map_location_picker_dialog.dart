import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapLocationPickerDialog extends StatefulWidget {
  const MapLocationPickerDialog({
    this.initialLatitude,
    this.initialLongitude,
    super.key,
  });

  final double? initialLatitude;
  final double? initialLongitude;

  static Future<LatLng?> show(
    BuildContext context, {
    double? initialLatitude,
    double? initialLongitude,
  }) {
    return showModalBottomSheet<LatLng>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => MapLocationPickerDialog(
        initialLatitude: initialLatitude,
        initialLongitude: initialLongitude,
      ),
    );
  }

  @override
  State<MapLocationPickerDialog> createState() =>
      _MapLocationPickerDialogState();
}

class _MapLocationPickerDialogState extends State<MapLocationPickerDialog> {
  late LatLng _selectedLatLng;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _selectedLatLng = LatLng(
      widget.initialLatitude ?? 50.4501,
      widget.initialLongitude ?? 30.5234,
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: AppColors.slate900,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          // Drag handle
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.slate700,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.selectCustomLocation,
                  style: const TextStyle(
                    color: AppColors.slate50,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: AppColors.slate400),
                ),
              ],
            ),
          ),
          // Coordinates indicator
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.slate800,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.slate700,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.explore_outlined,
                  color: AppColors.emerald,
                  size: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${_selectedLatLng.latitude.toStringAsFixed(6)}, '
                    '${_selectedLatLng.longitude.toStringAsFixed(6)}',
                    style: const TextStyle(
                      color: AppColors.slate50,
                      fontSize: 14,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Map area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _selectedLatLng,
                    initialZoom: widget.initialLatitude != null ? 14 : 7,
                    minZoom: 3,
                    maxZoom: 18,
                    onTap: (_, latLng) {
                      setState(() {
                        _selectedLatLng = latLng;
                      });
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
                      subdomains: const ['a', 'b', 'c', 'd'],
                      userAgentPackageName:
                          'com.digitalheritagelab.memorymap',
                      retinaMode: RetinaMode.isHighDensity(context),
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _selectedLatLng,
                          width: 60,
                          height: 60,
                          child: const Icon(
                            Icons.location_on,
                            color: AppColors.emerald,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Action button
          Padding(
            padding: const EdgeInsets.all(20),
            child: AppButton(
              onPressed: () {
                Navigator.of(context).pop(_selectedLatLng);
              },
              text: context.l10n.confirmLocation,
              icon: Icons.check_circle,
            ),
          ),
        ],
      ),
    );
  }
}

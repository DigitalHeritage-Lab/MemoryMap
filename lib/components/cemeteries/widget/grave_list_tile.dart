import 'dart:async';

import 'package:empty_template/l10n/l10n.dart';
import 'package:empty_template/shared/shared.dart';
import 'package:flutter/material.dart';

class GraveListTile extends StatelessWidget {
  const GraveListTile({required this.grave, super.key});

  final Grave grave;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.slate800,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.slate700),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AppNetworkImage(
            imageUrl: grave.photoUrl,
            width: 54,
            height: 54,
            fit: BoxFit.cover,
            placeholder: (context, url) => const ColoredBox(
              color: AppColors.slate700,
            ),
            errorWidget: (context, url, error) => const ColoredBox(
              color: AppColors.slate700,
              child: Icon(Icons.person, color: Colors.white24, size: 30),
            ),
          ),
        ),
        title: Text(
          grave.name,
          style: const TextStyle(
            color: AppColors.slate50,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            '${grave.birthDate}  —  ${grave.deathDate}',
            style: const TextStyle(
              color: AppColors.slate400,
              fontSize: 13,
            ),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: AppColors.slate500,
        ),
        onTap: () => _showGraveDetailsSheet(context, grave),
      ),
    );
  }
}

void _showGraveDetailsSheet(BuildContext context, Grave grave) {
  unawaited(
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.slate900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => _GraveDetailsSheet(
          grave: grave,
          scrollController: scrollController,
        ),
      ),
    ),
  );
}

// ---------------------------------------------------------------------------
// Private stateless widget — the bottom sheet content
// ---------------------------------------------------------------------------

class _GraveDetailsSheet extends StatelessWidget {
  const _GraveDetailsSheet({
    required this.grave,
    required this.scrollController,
  });

  final Grave grave;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.slate700,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Photo
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AppNetworkImage(
                imageUrl: grave.photoUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const ColoredBox(
                  color: AppColors.slate700,
                  child: Icon(
                    Icons.person,
                    color: Colors.white24,
                    size: 60,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Name
          Text(
            grave.name,
            style: const TextStyle(
              color: AppColors.slate50,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          // Dates
          Center(
            child: Text(
              '${grave.birthDate}  —  ${grave.deathDate}',
              style: const TextStyle(
                color: AppColors.emerald,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.slate700),
          const SizedBox(height: 16),

          // GPS
          Text(
            context.l10n.gpsCoordinates,
            style: const TextStyle(
              color: AppColors.slate50,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.gps_fixed, color: AppColors.gold, size: 16),
              const SizedBox(width: 8),
              Text(
                '${grave.latitude.toStringAsFixed(6)}, '
                '${grave.longitude.toStringAsFixed(6)}',
                style: const TextStyle(
                  color: AppColors.slate400,
                  fontSize: 14,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Bio
          Text(
            context.l10n.bio,
            style: const TextStyle(
              color: AppColors.slate50,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            grave.bio.isNotEmpty ? grave.bio : context.l10n.noInformation,
            style: const TextStyle(
              color: AppColors.slate400,
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

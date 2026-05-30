import 'package:flutter/material.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.navProfile,
          style: const TextStyle(
            color: AppColors.slate50,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.slate900,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.engineering_outlined,
                    size: 64,
                    color: AppColors.slate500,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.inDevelopment,
                    style: const TextStyle(
                      color: AppColors.slate400,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: VersionWidget(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_map/l10n/l10n.dart';
import 'package:memory_map/shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    var currentIndex = 0;
    if (location.startsWith('/cemeteries')) {
      currentIndex = 0;
    } else if (location.startsWith('/map')) {
      currentIndex = 1;
    } else if (location.startsWith('/graves')) {
      currentIndex = 2;
    } else if (location.startsWith('/digitize')) {
      currentIndex = 3;
    } else if (location.startsWith('/profile')) {
      currentIndex = 4;
    }

    return AppScaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/cemeteries');
            case 1:
              context.go('/map');
            case 2:
              context.go('/graves');
            case 3:
              context.go('/digitize');
            case 4:
              context.go('/profile');
          }
        },
        backgroundColor: AppColors.slate800,
        selectedItemColor: AppColors.emerald,
        unselectedItemColor: AppColors.slate500,
        type: BottomNavigationBarType
            .fixed, // Ensure bar stays stable with 4 items
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_balance_outlined),
            activeIcon: const Icon(Icons.account_balance),
            label: context.l10n.navCemeteries,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.map_outlined),
            activeIcon: const Icon(Icons.map),
            label: context.l10n.navMap,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search_outlined),
            activeIcon: const Icon(Icons.search),
            label: context.l10n.navGraves,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_circle_outline),
            activeIcon: const Icon(Icons.add_circle),
            label: context.l10n.navDigitize,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person),
            label: context.l10n.navProfile,
          ),
        ],
      ),
    );
  }
}

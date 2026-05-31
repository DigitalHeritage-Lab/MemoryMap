import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_map/components/cemeteries/view/cemeteries_view.dart';
import 'package:memory_map/components/cemeteries/view/cemetery_detail_view.dart';
import 'package:memory_map/components/digitize/view/digitize_view.dart';
import 'package:memory_map/components/graves/view/graves_view.dart';
import 'package:memory_map/components/home/view/home_page.dart';
import 'package:memory_map/components/map/view/map_view.dart';
import 'package:memory_map/components/profile/view/profile_view.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/cemeteries',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: [
        GoRoute(
          path: '/cemeteries',
          builder: (context, state) => const CemeteriesScreen(),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return CemeteryDetailScreen(cemeteryId: id);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/map',
          builder: (context, state) => const MapScreen(),
        ),
        GoRoute(
          path: '/graves',
          builder: (context, state) => const GravesScreen(),
        ),
        GoRoute(
          path: '/digitize',
          builder: (context, state) {
            final imagePath = state.extra as String?;
            return DigitizeScreen(initialImagePath: imagePath);
          },
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);

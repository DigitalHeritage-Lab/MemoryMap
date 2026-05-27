import 'package:empty_template/components/cemeteries/view/cemeteries_view.dart';
import 'package:empty_template/components/cemeteries/view/cemetery_detail_view.dart';
import 'package:empty_template/components/digitize/view/digitize_view.dart';
import 'package:empty_template/components/graves/view/graves_view.dart';
import 'package:empty_template/components/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          path: '/graves',
          builder: (context, state) => const GravesScreen(),
        ),
        GoRoute(
          path: '/digitize',
          builder: (context, state) => const DigitizeScreen(),
        ),
      ],
    ),
  ],
);

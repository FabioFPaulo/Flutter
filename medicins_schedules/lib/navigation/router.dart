import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicins_schedules/navigation/navigation.dart';
import 'package:medicins_schedules/screens/auth/views/welcome_screen.dart';
import 'package:medicins_schedules/screens/private/home/views/home_screen.dart';
import 'package:medicins_schedules/templates/private_template.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter routerPublic = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: Routes.login.route,
  routes: [
    GoRoute(
      path: Routes.login.route,
      builder: (context, state) => WelcomeScreen(),
    ),
  ],
);

final GoRouter routerPrivate = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: Routes.home.route,
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              PrivateTemplate(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home.route,
              builder: (context, state) => HomeScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

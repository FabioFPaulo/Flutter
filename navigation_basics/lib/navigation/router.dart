import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_basics/navigation/routes.dart';
import 'package:navigation_basics/screens/home_screen.dart';
import 'package:navigation_basics/screens/login_screen.dart';
import 'package:navigation_basics/screens/profile_screen.dart';
import 'package:navigation_basics/screens/settings_screen.dart';
import 'package:navigation_basics/screens/settings_theme.dart';
import 'package:navigation_basics/templates/private_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home.route,
  routes: <RouteBase>[
    GoRoute(
      name: "Login",
      path: "/login",
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) => PrivateScaffold(
            navigationShell: navigationShell,
            appTitle: state.name ?? "",
          ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home.route,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile.route,
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.settings.route,
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  path: Routes.settingsTheme.route,
                  builder: (context, state) => SettingsTheme(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

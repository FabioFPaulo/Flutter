import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_basics/data/bottom_menu_data.dart';

class PrivateScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final String appTitle;

  const PrivateScaffold({
    super.key,
    required this.navigationShell,
    required this.appTitle,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: navigationShell,
    appBar: AppBar(title: Text("Hello $appTitle")),
    bottomNavigationBar: NavigationBar(
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: navigationShell.goBranch,
      indicatorColor: Theme.of(context).primaryColor,
      destinations:
          bottomMenu
              .map(
                (menuItem) => NavigationDestination(
                  icon: Icon(menuItem.icon),
                  label: menuItem.label,
                  selectedIcon: Icon(menuItem.icon, color: Colors.white),
                ),
              )
              .toList(),
    ),
  );
}

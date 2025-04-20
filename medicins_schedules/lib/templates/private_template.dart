import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicins_schedules/utils/breakpoints.dart';

import '../data/sidebar_menu_data.dart';

class PrivateTemplate extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const PrivateTemplate({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final Breakpoints breakpoints = Breakpoints(context);

    return Scaffold(
      bottomNavigationBar:
          breakpoints.down(BreakpointsData.md)
              ? NavigationBar(
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: navigationShell.goBranch,
                backgroundColor: Colors.white,
                destinations:
                    sidebarMenuData
                        .map(
                          (menuItem) => _bottombarItem(
                            label: menuItem.label,
                            icon: menuItem.icon,
                          ),
                        )
                        .toList(),
              )
              : null,
      body: Row(
        children: [
          if (breakpoints.upOrEqual(BreakpointsData.md))
            NavigationRail(
              labelType: NavigationRailLabelType.all,
              groupAlignment: 0,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: navigationShell.goBranch,

              destinations:
                  sidebarMenuData
                      .map(
                        (menuItem) => _sidebarItem(
                          label: menuItem.label,
                          icon: menuItem.icon,
                        ),
                      )
                      .toList(),
            ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: navigationShell,
              ),
            ),
          ),
        ],
      ),
    );
  }

  NavigationDestination _bottombarItem({
    required String label,
    required IconData icon,
  }) {
    return NavigationDestination(
      icon: Icon(icon),
      label: label,
      selectedIcon: Icon(icon),
    );
  }

  NavigationRailDestination _sidebarItem({
    required String label,
    required IconData icon,
  }) {
    return NavigationRailDestination(
      icon: Icon(icon),
      selectedIcon: Icon(icon),
      label: Text(label),
    );
  }
}

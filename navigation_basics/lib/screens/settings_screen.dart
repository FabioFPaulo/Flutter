import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_basics/navigation/routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Settings"),
          ElevatedButton(
            onPressed: () => context.push(Routes.settingsTheme.fullRoute),
            child: const Text('Go to the Theme Settings'),
          ),
        ],
      ),
    );
  }
}

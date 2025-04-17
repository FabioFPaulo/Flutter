import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsTheme extends StatelessWidget {
  /// Constructs a [SettingsTheme]
  const SettingsTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Settings Theme"),
          ElevatedButton(
            onPressed: () => context.pop(),
            child: const Text('Go back'),
          ),
        ],
      ),
    );
  }
}

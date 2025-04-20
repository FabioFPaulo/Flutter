import 'package:flutter/widgets.dart';

class DashboardToolboxItem {
  final IconData icon;
  final String label;
  final String route;

  const DashboardToolboxItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

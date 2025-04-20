import 'package:flutter/material.dart';
import 'package:medicins_schedules/models/dashboard_toolbox_item.dart';
import 'package:medicins_schedules/navigation/routes.dart';

final List<DashboardToolboxItem> dependentToolboxData = [
  DashboardToolboxItem(
    label: "Health History",
    icon: Icons.monitor_heart_rounded,
    route: Routes.health.fullRoute,
  ),
  DashboardToolboxItem(
    label: "Medic Receips",
    icon: Icons.description_rounded,
    route: Routes.receips.fullRoute,
  ),
  DashboardToolboxItem(
    label: "Planning Medicins",
    icon: Icons.calendar_month_rounded,
    route: Routes.planning.fullRoute,
  ),
  DashboardToolboxItem(
    label: "Medicins",
    icon: Icons.healing,
    route: Routes.medicins.fullRoute,
  ),
];

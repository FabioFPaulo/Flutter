import 'package:flutter/material.dart';

class Breakpoints {
  final BuildContext context;

  const Breakpoints(this.context);

  final Map<BreakpointsData, int> _data = const {
    BreakpointsData.xs: 0,
    BreakpointsData.sm: 600,
    BreakpointsData.md: 900,
    BreakpointsData.lg: 1200,
    BreakpointsData.xl: 1536,
  };

  bool up(BreakpointsData key) =>
      MediaQuery.of(context).size.width > _data[key]!;

  bool upOrEqual(BreakpointsData key) =>
      MediaQuery.of(context).size.width >= _data[key]!;

  bool down(BreakpointsData key) =>
      MediaQuery.of(context).size.width < _data[key]!;

  bool downOrEqual(BreakpointsData key) =>
      MediaQuery.of(context).size.width <= _data[key]!;
}

enum BreakpointsData { xs, sm, md, lg, xl }

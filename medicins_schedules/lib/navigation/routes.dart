class Routes {
  final String route;
  final String fullRoute;

  const Routes(this.route, this.fullRoute);

  static const Routes login = Routes("/login", "/login");

  static const Routes home = Routes("/home", "/home");

  static const Routes profile = Routes("/profile", "/profile");

  static const Routes dependents = Routes("/dependents", "/dependents");
  static const Routes receips = Routes("/receips", "/dependents/receips");
  static const Routes medicins = Routes("/medicins", "/dependents/medicins");
  static const Routes planning = Routes("/planning", "/dependents/planning");
  static const Routes health = Routes("/health", "/dependents/health");
}

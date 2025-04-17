class Routes {
  final String route;
  final String fullRoute;

  const Routes(this.route, this.fullRoute);

  static const Routes home = Routes("/home", "/home");
  static const Routes profile = Routes("/profile", "/profile");
  static const Routes settings = Routes("/settings", "/settings");
  static const Routes settingsTheme = Routes(
    "/settings-theme",
    "/settings/settings-theme",
  );
}

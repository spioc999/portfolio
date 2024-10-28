enum RouteNames {
  home,
}

extension RouteNamesExt on RouteNames {
  String get path => switch (this) { RouteNames.home => "/" };
}

enum RouteNames {
  home,
  notFound,
}

extension RouteNamesExt on RouteNames {
  String? get path => switch (this) {
        RouteNames.home => "/",
        RouteNames.notFound => null,
      };
}

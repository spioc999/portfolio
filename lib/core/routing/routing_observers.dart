import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/core/routing/route_name.dart';
import 'package:spioc_portfolio/core/routing/routing_config.dart';
import 'package:spioc_portfolio/utils/web_utils.dart';

class WebAppTitleNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setWebAppTitle(route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setWebAppTitle(previousRoute?.settings.name);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _setWebAppTitle(previousRoute?.settings.name);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _setWebAppTitle(newRoute?.settings.name);
  }

  void _setWebAppTitle(String? name) {
    final routeEnum = RouteName.values.firstWhereOrNull((r) => r.name == name);

    if (routeEnum == null) return;

    final context = globalNavigatorKey.currentState?.context;
    String? prefix;

    if (context != null) {
      prefix = routeEnum.title(context);
    }

    final title = prefix != null ? '$prefix | $fullName' : fullName;
    WebUtils.setTitle(title);
  }
}

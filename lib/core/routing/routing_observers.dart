import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/core/routing/route_names.dart';
import 'package:spioc_portfolio/core/routing/routing_config.dart';
import 'package:spioc_portfolio/utils/web_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebAppTitleNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _setWebAppTitle(route.settings.name, route.settings.arguments);

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _setWebAppTitle(
          previousRoute?.settings.name, previousRoute?.settings.arguments);

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      _setWebAppTitle(
          previousRoute?.settings.name, previousRoute?.settings.arguments);

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      _setWebAppTitle(newRoute?.settings.name, newRoute?.settings.arguments);

  void _setWebAppTitle(String? name, [dynamic arguments]) {
    final routeEnum = RouteNames.values.firstWhereOrNull((r) => r.name == name);

    if (routeEnum == null) return;

    // Only for handled routes, we set the title related to that page
    // or webAppTitle as default

    String? suffix;

    final context = globalNavigatorKey.currentState?.context;

    if (context != null) {
      switch (routeEnum) {
        case RouteNames.home:
          suffix = AppLocalizations.of(context)?.homeview_tabtitle;
          break;
        default:
          break;
      }
    }

    final title = suffix != null ? '$initials | $suffix' : initials;
    WebUtils.setTitle(title);
  }
}

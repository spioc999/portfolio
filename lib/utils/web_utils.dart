import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/routing/route_name.dart';
import 'package:spioc_portfolio/core/routing/routing_config.dart';
import 'package:spioc_portfolio/interactors/interactors.dart';

class WebUtils {
  static void setTitle(String title) async {
    Future.microtask(
      () {
        SystemChrome.setApplicationSwitcherDescription(
          ApplicationSwitcherDescription(
            label: title,
            primaryColor: Colors.black.value,
          ),
        );
      },
    );
  }

  static String getTitleByRoute(String? route, [BuildContext? context]) {
    final routeEnum = RouteName.values.firstWhereOrNull((r) => r.name == route);

    final fullName = getIt<PersonalDataInteractor>().fullName;

    if (routeEnum == null) return fullName;

    context ??= globalNavigatorKey.currentState?.context;
    String? prefix;
    if (context != null) prefix = routeEnum.title(context);

    return prefix != null ? '$prefix | $fullName' : fullName;
  }

  static void setTitleByRoute(String? route, [BuildContext? context]) =>
      setTitle(getTitleByRoute(route, context));
}

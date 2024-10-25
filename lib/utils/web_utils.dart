import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/routing/route_name.dart';
import 'package:spioc_portfolio/core/config/routing_config.dart';
import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/utils/extensions.dart';

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

  static String getTitleFromCurrentRoute(BuildContext context) {
    final currentRoute = shellNavigatorKey.currentRouteName ??
        globalNavigatorKey.currentRouteName;
    final routeEnum =
        RouteName.values.firstWhereOrNull((r) => r.name == currentRoute);

    final fullName = getIt<PersonalDataInteractor>().fullName;
    if (routeEnum == null) return fullName;

    final prefix = routeEnum.title(context);
    return prefix != null ? '$prefix | $fullName' : fullName;
  }
}

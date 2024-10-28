import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/routing/route_names.dart';
import 'package:spioc_portfolio/core/routing/routing_observers.dart';
import 'package:spioc_portfolio/views/views.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

void initRouting({bool reflectsImperativeAPIs = true}) {
  GoRouter.optionURLReflectsImperativeAPIs = reflectsImperativeAPIs;
}

final routerConfig = GoRouter(
  initialLocation: RouteNames.home.path,
  navigatorKey: globalNavigatorKey,
  observers: [WebAppTitleNavigationObserver()],
  routes: [
    GoRoute(
      path: RouteNames.home.path!,
      name: RouteNames.home.name,
      pageBuilder: (context, state) => NoTransitionPage(
        name: state.name,
        child: getIt<HomeView>(),
      ),
    ),
  ],
  errorPageBuilder: (context, _) => NoTransitionPage(
    name: RouteNames.notFound.name,
    child: getIt<NotFoundView>(),
  ),
);

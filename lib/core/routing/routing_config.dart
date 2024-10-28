import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/routing/route_name.dart';
import 'package:spioc_portfolio/core/routing/routing_observers.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_shell_navigator_scaffold.dart';
import 'package:spioc_portfolio/views/views.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

void initRouting({bool reflectsImperativeAPIs = true}) {
  GoRouter.optionURLReflectsImperativeAPIs = reflectsImperativeAPIs;
}

final routerConfig = GoRouter(
  initialLocation: RouteName.home.path,
  navigatorKey: globalNavigatorKey,
  observers: [WebAppTitleNavigationObserver()],
  routes: [
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      parentNavigatorKey: globalNavigatorKey,
      observers: [WebAppTitleNavigationObserver()],
      builder: (context, state, child) => PortfolioShellNavigatorScaffold(
        route: RouteName.values.firstWhere(
          (r) => r.path == state.matchedLocation,
          orElse: () => RouteName.home,
        ),
        child: child,
      ),
      routes: [
        GoRoute(
          path: RouteName.home.path,
          name: RouteName.home.name,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: getIt<HomeView>(),
          ),
        ),
        GoRoute(
          path: RouteName.aboutMe.path,
          name: RouteName.aboutMe.name,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: getIt<AboutMeView>(),
          ),
        ),
        GoRoute(
          path: RouteName.education.path,
          name: RouteName.education.name,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: getIt<EducationView>(),
          ),
        ),
        GoRoute(
          path: RouteName.experience.path,
          name: RouteName.experience.name,
          parentNavigatorKey: shellNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: getIt<ExperienceView>(),
          ),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, _) => NoTransitionPage(
    name: RouteName.notFound.name,
    child: getIt<NotFoundView>(),
  ),
);

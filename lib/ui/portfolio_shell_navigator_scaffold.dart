import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/core/routing/route_name.dart';
import 'package:spioc_portfolio/core/routing/routing_helper.dart';

class PortfolioShellNavigatorScaffold extends StatefulWidget {
  final Widget child;
  final RouteName route;

  const PortfolioShellNavigatorScaffold({
    super.key,
    required this.child,
    required this.route,
  });

  @override
  State<PortfolioShellNavigatorScaffold> createState() =>
      _PortfolioShellNavigatorScaffoldState();
}

class _PortfolioShellNavigatorScaffoldState
    extends State<PortfolioShellNavigatorScaffold> {
  static const bottomDividerHeight = 1.0;

  late RouteName selectedRoute;

  @override
  void initState() {
    super.initState();
    selectedRoute = widget.route;
  }

  @override
  void didUpdateWidget(covariant PortfolioShellNavigatorScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.route != widget.route) {
      setState(() => selectedRoute = widget.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Dimens.appBarHeight),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    RoutingHelper.goNamed(context, RouteName.home);
                  },
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        fixedSize: const WidgetStatePropertyAll(
                          Size(
                            Dimens.appBarHeight + Dimens.smallMargin,
                            Dimens.appBarHeight - bottomDividerHeight,
                          ),
                        ),
                      ),
                  child: const Text(
                    initials,
                  ),
                ),
                ...RouteNameExt.pages.map(
                  (route) => TextButton(
                    onPressed: () {
                      RoutingHelper.goNamed(context, route);
                    },
                    style: Theme.of(context).textButtonTheme.style?.copyWith(
                          fixedSize: const WidgetStatePropertyAll(
                            Size.fromHeight(
                              Dimens.appBarHeight - bottomDividerHeight,
                            ),
                          ),
                        ),
                    child: Text(
                      route.title(context)?.toUpperCase() ?? emptyString,
                      style: route == selectedRoute
                          ? const TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2.0,
                              fontWeight: FontWeight.bold,
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Theme.of(context).dividerColor,
              height: bottomDividerHeight,
              width: double.infinity,
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}

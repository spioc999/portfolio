import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
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
      appBar: AppBar(
        // TODO change me
        leadingWidth: double.maxFinite,
        leading: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                RoutingHelper.goNamed(context, RouteName.home);
              },
              child: Text(
                  '$initials${selectedRoute == RouteName.home ? "-" : ""}'),
            ),
            const SizedBox(
              width: 10,
            ),
            ...RouteNameExt.pages.map(
              (route) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ElevatedButton(
                  onPressed: () {
                    RoutingHelper.goNamed(context, route);
                  },
                  child: Text(
                    '${route.title(context)}${route == selectedRoute ? "-" : ""}',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}

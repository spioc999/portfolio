import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/core/providers.dart';
import 'package:spioc_portfolio/core/routing/route_name.dart';
import 'package:spioc_portfolio/core/routing/routing_helper.dart';
import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/utils/extensions.dart';

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
  late String initials;

  ButtonStyle? get _navigationAndSettingsButtonStyle =>
      Theme.of(context).textButtonTheme.style?.copyWith(
            fixedSize: const WidgetStatePropertyAll(
              Size.fromHeight(
                Dimens.appBarHeight - bottomDividerHeight,
              ),
            ),
          );

  late RouteName selectedRoute;

  @override
  void initState() {
    super.initState();
    selectedRoute = widget.route;
    initials = getIt<PersonalDataInteractor>().initials;
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
    final languageCode = Localizations.localeOf(context).languageCode;
    final themeBrightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(Dimens.appBarHeight),
        child: Column(
          children: [
            SizedBox(
              height: Dimens.appBarHeight - bottomDividerHeight,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                physics: defaultScrollPhysics,
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () =>
                              RoutingHelper.goNamed(context, RouteName.home),
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.copyWith(
                                fixedSize: const WidgetStatePropertyAll(
                                  Size(
                                    Dimens.appBarHeight + Dimens.smallMargin,
                                    Dimens.appBarHeight - bottomDividerHeight,
                                  ),
                                ),
                              ),
                          child: Text(
                            initials,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        ...RouteNameExt.pages.map(
                          (route) => TextButton(
                            onPressed: () =>
                                RoutingHelper.goNamed(context, route),
                            style: _navigationAndSettingsButtonStyle,
                            child: Text(
                              route.title(context)?.toUpperCase() ??
                                  emptyString,
                              style: route == selectedRoute
                                  ? const TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2.0,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : null,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Tooltip(
                            message: l10n.generic_switch_language_tooltip,
                            child: TextButton(
                              onPressed: () => Provider.of<AppSettingsProvider>(
                                context,
                                listen: false,
                              ).switchLocale(languageCode),
                              style: _navigationAndSettingsButtonStyle,
                              child: Text(languageCode.toUpperCase()),
                            ),
                          ),
                          Tooltip(
                            message: l10n.generic_switch_theme_tooltip,
                            child: TextButton(
                              onPressed: () => Provider.of<AppSettingsProvider>(
                                context,
                                listen: false,
                              ).switchThemeByBrightness(themeBrightness),
                              style: _navigationAndSettingsButtonStyle,
                              child: Icon(
                                themeBrightness == Brightness.dark
                                    ? Icons.dark_mode_outlined
                                    : Icons.light_mode_outlined,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const AppDivider.horizontal(
              height: bottomDividerHeight,
            ),
          ],
        ),
      ),
      body: SelectableRegion(
        focusNode: FocusNode(),
        selectionControls: materialTextSelectionControls,
        child: widget.child,
      ),
    );
  }
}

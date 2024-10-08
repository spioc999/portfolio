import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/core/routing/route_name.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_navigation_scaffold.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/not_found/not_found_contracts.dart';

class NotFoundView extends BaseMvvmStatefulWidget {
  NotFoundView({super.key}) : super(_NotFoundViewState());
}

class _NotFoundViewState
    extends BaseState<NotFoundView, NotFoundViewModelContract, NotFoundState>
    implements NotFoundViewContract {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<NotFoundViewModelContract, NotFoundState>(
      model: viewModel,
      builder: (context, viewModel, _) {
        return PortfolioNavigationScaffold(
          route: RouteName.notFound,
          child: PortfolioScrollableView(
            body: Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    l10n.notfoundview_errorcode,
                    textAlign: TextAlign.center,
                    style: ResponsiveValues.themeDisplayStyle(context),
                  ),
                ),
                const AppDivider.horizontal(
                  height: Dimens.tightDividerThickness,
                ),
                largeMarginGap,
                Text(
                  l10n.notfoundview_title,
                  style: ResponsiveValues.themeHeadingStyle(context),
                  textAlign: TextAlign.center,
                ),
                defaultMarginGap,
                Text(
                  l10n.notfoundview_subtitle,
                  style: ResponsiveValues.themeTitleStyle(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/core/routing/route_name.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_navigation_scaffold.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_helper.dart';
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
            body: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  Text(
                    l10n.notfoundview_errorcode,
                    textAlign: TextAlign.center,
                    style: ResponsiveValues.themeDisplayStyle(context),
                  ),
                  Text(
                    l10n.notfoundview_title,
                    style: ResponsiveValues.themeTitleStyle(context),
                    textAlign: TextAlign.center,
                  ),
                  defaultMarginGap,
                  Text(
                    l10n.notfoundview_subtitle,
                    style: ResponsiveValues.themeBodyStyle(context),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

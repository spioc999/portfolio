import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_helper.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/about_me/about_me_contracts.dart';

class AboutMeView extends BaseMvvmStatefulWidget {
  AboutMeView({super.key}) : super(_AboutMeViewState());
}

class _AboutMeViewState
    extends BaseState<AboutMeView, AboutMeViewModelContract, AboutMeState>
    implements AboutMeViewContract {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AboutMeViewModelContract, AboutMeState>(
      model: viewModel,
      builder: (context, viewModel, child) {
        return PortfolioScrollableView(
          body: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  l10n.aboutmeview_title,
                  textAlign: TextAlign.center,
                  style: ResponsiveValues.themeDisplayStyle(context),
                ),
              ),
              const AppDivider.horizontal(
                height: Dimens.tightDividerThickness,
              ),
              veryLargeMarginGap,
              Text(
                vmState.intro(l10n, {'yearsOld': vmState.yearsOld}),
                style: ResponsiveValues.themeBodyStyle(context),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        );
      },
    );
  }
}

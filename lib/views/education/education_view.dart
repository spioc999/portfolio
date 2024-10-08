import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/constants/keys.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/education/_education_item.dart';
import 'package:spioc_portfolio/views/education/education_contracts.dart';

class EducationView extends BaseMvvmStatefulWidget {
  EducationView({super.key}) : super(_EducationViewState());
}

class _EducationViewState
    extends BaseState<EducationView, EducationViewModelContract, EducationState>
    implements EducationViewContract {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<EducationViewModelContract, EducationState>(
      model: viewModel,
      builder: (context, viewModel, child) {
        return PortfolioScrollableView(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    l10n.educationview_title,
                    textAlign: TextAlign.center,
                    style: ResponsiveValues.themeDisplayStyle(context),
                  ),
                ),
              ),
              const AppDivider.horizontal(
                height: Dimens.tightDividerThickness,
              ),
              ...vmState.educations.map(
                (e) => EducationItem(
                  key: Key(EducationKeys.item(e.identifier)),
                  education: e,
                  onLinkTap: viewModel.onExternalUrlTap,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

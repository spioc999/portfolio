import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/constants/keys.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/experience/_experience_item.dart';
import 'package:spioc_portfolio/views/experience/experience_contracts.dart';

class ExperienceView extends BaseMvvmStatefulWidget {
  ExperienceView({super.key}) : super(_ExperienceViewState());
}

class _ExperienceViewState extends BaseState<
    ExperienceView,
    ExperienceViewModelContract,
    ExperienceState> implements ExperienceViewContract {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ExperienceViewModelContract, ExperienceState>(
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
                    l10n.experienceview_title,
                    textAlign: TextAlign.center,
                    style: ResponsiveValues.themeDisplayStyle(context),
                  ),
                ),
              ),
              const AppDivider.horizontal(
                height: Dimens.tightDividerThickness,
              ),
              ...vmState.experiences.map(
                (e) => ExperienceItem(
                  key: Key(ExperienceKeys.item(e.identifier)),
                  experience: e,
                  onLinkTap: viewModel.onLinkTap,
                ),
              ),
              if (vmState.otherExperiences.isNotEmpty) ...[
                superGigantMarginGap,
                Text(
                  l10n.experienceview_otherexperiences_label,
                  style: ResponsiveValues.themeHeadingStyle(context),
                ),
                ...vmState.otherExperiences.map(
                  (oE) => ExperienceItem(
                    key: Key(
                      ExperienceKeys.otherItem(oE.identifier),
                    ),
                    experience: oE,
                    onLinkTap: viewModel.onLinkTap,
                  ),
                )
              ]
            ],
          ),
        );
      },
    );
  }
}

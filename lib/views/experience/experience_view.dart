import 'package:flutter/material.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
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
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  l10n.experienceview_title,
                  textAlign: TextAlign.center,
                  style: ResponsiveValues.themeDisplayStyle(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

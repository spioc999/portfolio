import 'package:flutter/material.dart';
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
        return Center(
          child: Text(
            'Experience',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
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
        return Center(
          child: Text('Education'),
        );
      },
    );
  }
}

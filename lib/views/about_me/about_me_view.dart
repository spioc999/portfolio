import 'package:flutter/material.dart';
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
        return Center(
          child: Text(
            'About Me',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

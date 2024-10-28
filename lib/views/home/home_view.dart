import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/ui/components/personal_rounded_images.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/home/home_contracts.dart';

class HomeView extends BaseMvvmStatefulWidget {
  HomeView({super.key}) : super(_HomeViewState());
}

class _HomeViewState
    extends BaseState<HomeView, HomeViewModelContract, HomeState>
    implements HomeViewContract {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModelContract, HomeState>(
      model: viewModel,
      builder: (context, viewModel, _) {
        return Center(
          child: SingleChildScrollView(
            padding: defaultHorizontalPadding.copyWith(
              top: Dimens.largeMargin,
              bottom: Dimens.largeMargin,
            ),
            child: Column(
              children: [
                const PersonalRoundedImages(),
                const SizedBox(
                  height: Dimens.defaultMargin,
                ),
                Text(
                  Me.fullName,
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: Dimens.defaultMargin,
                ),
                Text(
                  vmState.role(l10n),
                  style: Theme.of(context).textTheme.titleLarge,
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
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
        return CustomScrollView(
          physics: defaultScrollPhysics,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: defaultHorizontalPadding.copyWith(
                  top: Dimens.extraLargeMargin,
                  bottom: Dimens.extraLargeMargin,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const PersonalRoundedImages(),
                    const Gap(Dimens.defaultMargin),
                    Text(
                      Me.firstName,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      Me.lastName,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(Dimens.defaultMargin),
                    Text(
                      vmState.role(l10n),
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppDivider.horizontal(height: 0.5),
                    Padding(
                      padding: defaultHorizontalPadding.copyWith(
                          top: Dimens.smallMargin, bottom: Dimens.smallMargin),
                      child: Text(
                        l10n.homeview_footer_label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

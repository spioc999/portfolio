import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/ui/components/expandable_rounded_network_image.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/home/home_contracts.dart';

class HomeView extends BaseMvvmStatefulWidget {
  HomeView({super.key}) : super(_HomeViewState());
}

class _HomeViewState
    extends BaseState<HomeView, HomeViewModelContract, HomeState>
    implements HomeViewContract {
  static const _switchingImagesDuration = Duration(seconds: 2);

  late Timer _switchingImagesTimer;
  late int _imageIndex;

  @override
  void initializeImagesTimer() {
    _imageIndex = Random().nextInt(vmState.imageUrls.length);
    _switchingImagesTimer = Timer.periodic(_switchingImagesDuration, (_) {
      setState(
          () => _imageIndex = (_imageIndex + 1) % vmState.imageUrls.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModelContract, HomeState>(
      model: viewModel,
      builder: (context, viewModel, _) {
        return PortfolioScrollableView(
          body: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ExpandableRoundedNetworkImage(vmState.imageUrls[_imageIndex]),
                defaultMarginGap,
                Text(
                  vmState.firstName,
                  style: ResponsiveValues.themeDisplayStyle(context),
                  textAlign: TextAlign.center,
                ),
                Text(
                  vmState.lastName,
                  style: ResponsiveValues.themeDisplayStyle(context),
                  textAlign: TextAlign.center,
                ),
                verySmallMarginGap,
                Text(
                  vmState.role,
                  style: ResponsiveValues.themeHeadingStyle(context),
                  textAlign: TextAlign.center,
                ),
                largeMarginGap,
                const AppDivider.horizontal(
                  width: Dimens.gigantMargin,
                ),
                largeMarginGap,
                Wrap(
                  children: vmState.contacts
                      .map(
                        (c) => TextButton(
                          onPressed: () => viewModel.onContactTap(c),
                          child: Icon(c.icon),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _switchingImagesTimer.cancel();
    super.dispose();
  }
}

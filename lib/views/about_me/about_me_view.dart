import 'package:confetti/confetti.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/about_me/about_me_contracts.dart';

class AboutMeView extends BaseMvvmStatefulWidget {
  AboutMeView({super.key}) : super(_AboutMeViewState());
}

class _AboutMeViewState
    extends BaseState<AboutMeView, AboutMeViewModelContract, AboutMeState>
    implements AboutMeViewContract {
  static const _celebrateDuration = Duration(seconds: 5);
  final _confettiController = ConfettiController(duration: _celebrateDuration);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AboutMeViewModelContract, AboutMeState>(
      model: viewModel,
      builder: (context, viewModel, child) {
        return PortfolioScrollableView(
          body: Stack(
            children: [
              Column(
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
                  RichText(
                    //TODO fix me for selection
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: l10n.aboutmeview_intro_1(
                              vmState.firstName, vmState.yearsOld),
                        ),
                        const TextSpan(text: whitespaceString),
                        if (vmState.isBirthdayToday) ...[
                          TextSpan(
                            text: l10n.aboutmeview_intro_letscelebrate,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = viewModel.onLetsCelebrateTap,
                          ),
                          const TextSpan(text: whitespaceString),
                        ],
                        TextSpan(
                          text: l10n.aboutmeview_intro_2(vmState.role),
                        ),
                      ],
                      style: ResponsiveValues.themeBodyStyle(context),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void startLetsCelebrate() => _confettiController.play();

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }
}

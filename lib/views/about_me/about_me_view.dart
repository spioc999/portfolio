import 'package:confetti/confetti.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/constants/keys.dart';
import 'package:spioc_portfolio/models/models.dart';
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
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: _celebrateDuration);
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AboutMeViewModelContract, AboutMeState>(
      model: viewModel,
      builder: (context, viewModel, child) {
        return PortfolioScrollableView(
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        l10n.aboutmeview_title,
                        textAlign: TextAlign.center,
                        style: ResponsiveValues.themeDisplayStyle(context),
                      ),
                    ),
                  ),
                  const AppDivider.horizontal(
                    height: Dimens.tightDividerThickness,
                  ),
                  veryLargeMarginGap,
                  Text.rich(
                    TextSpan(
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
                  if (vmState.technologies.isNotEmpty)
                    _TechStackSection(
                      key: const Key(AboutMeKeys.techStackSection),
                      technologies: vmState.technologies,
                    ),
                  if (vmState.hobbies.isNotEmpty)
                    _HobbiesSection(
                      key: const Key(AboutMeKeys.hobbiesSection),
                      hobbies: vmState.hobbies,
                    ),
                ],
              ),
              if (vmState.isBirthdayToday)
                Align(
                  alignment: Alignment.center,
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

class _TechStackSection extends StatelessWidget {
  final List<Technology> technologies;

  const _TechStackSection({
    super.key,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        veryLargeMarginGap,
        Align(
          alignment: Alignment.center,
          child: Text(
            l10n(context).aboutmeview_techstack_title,
            style: ResponsiveValues.themeTitleStyle(context),
          ),
        ),
        defaultMarginGap,
        Wrap(
          spacing: Dimens.smallMargin,
          runSpacing: Dimens.smallMargin,
          children: technologies
              .map(
                (t) => Chip(
                  avatar: Icon(t.icon),
                  label: Text(t.name),
                  labelStyle: ResponsiveValues.themeBodyStyle(context),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

class _HobbiesSection extends StatelessWidget {
  final List<Hobby> hobbies;

  const _HobbiesSection({
    super.key,
    required this.hobbies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        veryLargeMarginGap,
        Align(
          alignment: Alignment.center,
          child: Text(
            l10n(context).aboutmeview_hobbies_title,
            style: ResponsiveValues.themeTitleStyle(context),
          ),
        ),
        defaultMarginGap,
      ],
    );
  }
}

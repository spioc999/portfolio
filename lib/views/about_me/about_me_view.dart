import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/constants/keys.dart';
import 'package:spioc_portfolio/ui/components/app_divider.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_scollable_view.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';
import 'package:spioc_portfolio/utils/validation_utils.dart';
import 'package:spioc_portfolio/views/_base_mvvm/base_mvvm.dart';
import 'package:spioc_portfolio/views/about_me/_about_me_sections.dart';
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
                  if (!isNullOrEmpty(vmState.cvUrl))
                    AboutMeDownloadCv(
                      isDowloading: vmState.isDownloadingCv,
                      onDownloadTap: viewModel.onDownloadCvTap,
                    ),
                  AboutMeIntroSection(
                    key: const Key(AboutMeKeys.introSection),
                    intro: vmState.intro(
                      l10n,
                      {
                        'firstName': vmState.firstName,
                        'yearsOld': vmState.yearsOld,
                      },
                    ),
                    isBirthdayToday: vmState.isBirthdayToday,
                    onLetsCelebrateTap: viewModel.onLetsCelebrateTap,
                  ),
                  if (vmState.technologies.isNotEmpty)
                    AboutMeTechStackSection(
                      key: const Key(AboutMeKeys.techStackSection),
                      technologies: vmState.technologies,
                    ),
                  if (vmState.softSkills.isNotEmpty)
                    AboutMeSoftSkillsSection(
                      key: const Key(AboutMeKeys.softSkillsSection),
                      softSkills: vmState.softSkills,
                    ),
                  if (vmState.hobbies.isNotEmpty)
                    AboutMeHobbiesSection(
                      key: const Key(AboutMeKeys.hobbiesSection),
                      hobbies: vmState.hobbies,
                    ),
                  if (vmState.projects.isNotEmpty)
                    AboutMeProjectsSection(
                      key: const Key(AboutMeKeys.projectsSection),
                      projects: vmState.projects,
                      onLinkTap: viewModel.onExternalUrlTap,
                      moreProjectsLink: vmState.moreProjectsLink,
                    ),
                  if (vmState.certifications.isNotEmpty)
                    AboutMeCertificationsSection(
                      key: const Key(AboutMeKeys.certificationsSection),
                      certifications: vmState.certifications,
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

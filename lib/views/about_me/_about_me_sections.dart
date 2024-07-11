import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/constants/keys.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/ui/components/expandable_rounded_network_image.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_responsive_title_and_content_layout.dart';
import 'package:spioc_portfolio/ui/toolkit/transparent_inkwell.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class AboutMeIntroSection extends StatelessWidget {
  final String intro;
  final bool isBirthdayToday;
  final GestureTapCallback onLetsCelebrateTap;

  const AboutMeIntroSection({
    super.key,
    required this.intro,
    required this.isBirthdayToday,
    required this.onLetsCelebrateTap,
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioResponsiveTitleAndContentLayout(
      topMargin: Dimens.veryLargeMargin,
      title: Text(
        l10n(context).aboutmeview_intro_title,
        style: ResponsiveValues.themeHeadingStyle(context),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            intro,
            style: ResponsiveValues.themeBodyStyle(context),
          ),
          if (isBirthdayToday) ...[
            defaultMarginGap,
            TransparentInkWell(
              key: const Key(AboutMeKeys.letsCelebrateLabel),
              onTap: onLetsCelebrateTap,
              child: Text(
                l10n(context).aboutmeview_letscelebrate,
                style: ResponsiveValues.themeBodyStyle(context)?.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}

class AboutMeTechStackSection extends StatelessWidget {
  final List<Technology> technologies;

  const AboutMeTechStackSection({
    super.key,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioResponsiveTitleAndContentLayout(
      title: Text(
        l10n(context).aboutmeview_techstack_title,
        style: ResponsiveValues.themeHeadingStyle(context),
      ),
      content: Wrap(
        spacing: Dimens.smallMargin,
        runSpacing: Dimens.smallMargin,
        alignment: ResponsiveValues.wrapAlignment(context),
        children: technologies
            .map(
              (t) => Chip(
                avatar: Icon(
                  t.icon,
                  size: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
                label: Text(t.name),
                labelStyle: ResponsiveValues.themeBodyStyle(context),
              ),
            )
            .toList(),
      ),
    );
  }
}

class AboutMeSoftSkillsSection extends StatelessWidget {
  final List<SoftSkill> softSkills;

  const AboutMeSoftSkillsSection({
    super.key,
    required this.softSkills,
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioResponsiveTitleAndContentLayout(
      title: Text(
        l10n(context).aboutmeview_softskills_title,
        style: ResponsiveValues.themeHeadingStyle(context),
      ),
      content: Wrap(
        spacing: Dimens.smallMargin,
        runSpacing: Dimens.smallMargin,
        alignment: ResponsiveValues.wrapAlignment(context),
        children: softSkills
            .map(
              (s) => Chip(
                avatar: SelectionArea(
                  child: Text(
                    s.emoji,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                label: Text(s.label(l10n(context))),
                labelStyle: ResponsiveValues.themeBodyStyle(context),
              ),
            )
            .toList(),
      ),
    );
  }
}

class AboutMeHobbiesSection extends StatelessWidget {
  final List<Hobby> hobbies;

  const AboutMeHobbiesSection({
    super.key,
    required this.hobbies,
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioResponsiveTitleAndContentLayout(
      title: Text(
        l10n(context).aboutmeview_hobbies_title,
        style: ResponsiveValues.themeHeadingStyle(context),
      ),
      content: Wrap(
        spacing: Dimens.largeMargin,
        runSpacing: Dimens.smallMargin,
        alignment: ResponsiveValues.wrapAlignment(context),
        children: hobbies
            .map(
              (h) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ExpandableRoundedNetworkImage.small(
                    h.imageUrl,
                    size: ResponsiveValues.smallImageSize(context),
                  ),
                  smallMarginGap,
                  SizedBox(
                    width: ResponsiveValues.smallImageSize(context),
                    child: Text(
                      h.label(l10n(context)),
                      style: ResponsiveValues.themeBodyStyle(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class AboutMeProjectsSection extends StatelessWidget {
  final List<Project> projects;
  final Function(String) onLinkTap;
  final String? moreProjectsLink;

  const AboutMeProjectsSection({
    super.key,
    required this.projects,
    required this.onLinkTap,
    this.moreProjectsLink,
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioResponsiveTitleAndContentLayout(
      title: Text(
        l10n(context).aboutmeview_projects_title,
        style: ResponsiveValues.themeHeadingStyle(context),
      ),
      content: Column(
        crossAxisAlignment: ResponsiveValues.crossAxisAlignment(context),
        children: [
          Wrap(
            spacing: Dimens.largeMargin,
            runSpacing: Dimens.smallMargin,
            alignment: ResponsiveValues.wrapAlignment(context),
            crossAxisAlignment: WrapCrossAlignment.center,
            children: projects
                .map(
                  (h) => Card(
                    child: Container(
                      constraints: const BoxConstraints.tightFor(
                        width: Dimens.defaultCardWidth,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(Dimens.defaultCardPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              h.title,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            if (h.links.isNotEmpty)
                              Wrap(
                                spacing: Dimens.smallMargin,
                                alignment: WrapAlignment.start,
                                children: h.links
                                    .map(
                                      (link) => TransparentInkWell(
                                        onTap: () => onLinkTap(link.url),
                                        child: Text(
                                          link.label?.call(l10n(context)) ??
                                              l10n(context)
                                                  .aboutmeview_projects_repolink,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            defaultMarginGap,
                            Text(
                              "${h.description(l10n(context))}\n\n\n",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            largeMarginGap,
                            Wrap(
                              spacing: Dimens.defaultMargin,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                ...h.techIcons.map(
                                  (techIcon) => Icon(
                                    techIcon,
                                    size: Dimens.defaultSmallIconSize,
                                  ),
                                ),
                                ...h.hashtags.map(
                                  (hashTag) => Text(
                                    '#$hashTag',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          if (moreProjectsLink != null) ...[
            defaultMarginGap,
            TextButton(
              onPressed: () => onLinkTap(moreProjectsLink!),
              child: Text(
                '${l10n(context).generic_view_more} ➡️',
              ),
            )
          ]
        ],
      ),
    );
  }
}

class AboutMeCertificationsSection extends StatelessWidget {
  final List<Certification> certifications;

  const AboutMeCertificationsSection({
    super.key,
    required this.certifications,
  });

  @override
  Widget build(BuildContext context) {
    return PortfolioResponsiveTitleAndContentLayout(
      title: Text(
        l10n(context).aboutmeview_certifications_title,
        style: ResponsiveValues.themeHeadingStyle(context),
      ),
      content: Wrap(
        spacing: Dimens.smallMargin,
        runSpacing: Dimens.smallMargin,
        alignment: ResponsiveValues.wrapAlignment(context),
        children: certifications
            .map(
              (c) => Chip(
                avatar: Icon(
                  c.icon,
                  size: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
                label: Text(
                  c.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                labelStyle: ResponsiveValues.themeBodyStyle(context),
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/ui/components/expandable_rounded_network_image.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class AboutMeTechStackSection extends StatelessWidget {
  final List<Technology> technologies;

  const AboutMeTechStackSection({
    super.key,
    required this.technologies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        gigantMarginGap,
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
          alignment: WrapAlignment.center,
          children: technologies
              .map(
                (t) => Chip(
                  avatar: Icon(
                    t.icon,
                    size: Theme.of(context).textTheme.bodyMedium?.fontSize,
                  ),
                  padding: defaultChipPadding,
                  label: Text(t.name),
                  labelStyle: ResponsiveValues.themeBodyStyle(context),
                ),
              )
              .toList(),
        ),
      ],
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        gigantMarginGap,
        Align(
          alignment: Alignment.center,
          child: Text(
            l10n(context).aboutmeview_softskills_title,
            style: ResponsiveValues.themeTitleStyle(context),
          ),
        ),
        defaultMarginGap,
        Wrap(
          spacing: Dimens.smallMargin,
          runSpacing: Dimens.smallMargin,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
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
                  padding: defaultChipPadding,
                  label: Text(s.label(l10n(context))),
                  labelStyle: ResponsiveValues.themeBodyStyle(context),
                ),
              )
              .toList(),
        ),
      ],
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        gigantMarginGap,
        Align(
          alignment: Alignment.center,
          child: Text(
            l10n(context).aboutmeview_hobbies_title,
            style: ResponsiveValues.themeTitleStyle(context),
          ),
        ),
        defaultMarginGap,
        Wrap(
          spacing: Dimens.veryLargeMargin,
          runSpacing: Dimens.largeMargin,
          alignment: WrapAlignment.center,
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
                      width: Dimens.defaultSmallImageSize,
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
      ],
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        gigantMarginGap,
        Align(
          alignment: Alignment.center,
          child: Text(
            l10n(context).aboutmeview_certifications_title,
            style: ResponsiveValues.themeTitleStyle(context),
          ),
        ),
        defaultMarginGap,
      ],
    );
  }
}

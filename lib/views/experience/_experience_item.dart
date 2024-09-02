import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/experience.dart';
import 'package:spioc_portfolio/ui/components/app_markdown.dart';
import 'package:spioc_portfolio/ui/components/at_place_clickable.dart';
import 'package:spioc_portfolio/ui/components/logo_squared_network_image.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_time_bounded_layout.dart';
import 'package:spioc_portfolio/ui/layouts/row_or_column_layout.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class ExperienceItem extends StatelessWidget {
  final Experience experience;
  final Function(String) onLinkTap;

  const ExperienceItem({
    super.key,
    required this.experience,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.extraLargeMargin),
      child: PortfolioTimeBoundedLayout(
        startDateTime: experience.startDateTime,
        endDateTime: experience.endDateTime,
        child: RowOrColumnLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          first: LogoSquaredNetworkImage.experience(
            imgUrl: experience.companyImageUrl ?? emptyString,
          ),
          second: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experience.role(l10n(context)).toUpperCase(),
                style: ResponsiveValues.themeTitleStyle(context)?.copyWith(
                  height: Dimens.one,
                  fontWeight: FontWeight.bold,
                ),
              ),
              smallMarginGap,
              AtPlaceClickable(
                place: experience.company,
                link: experience.companyUrl,
                onLinkTap: onLinkTap,
                style: ResponsiveValues.themeBodyStyle(context),
              ),
              if (experience.locality != null ||
                  experience.workingType != null) ...[
                verySmallMarginGap,
                Text.rich(
                  TextSpan(
                    style: ResponsiveValues.themeLabelStyle(context),
                    children: [
                      if (experience.locality != null)
                        TextSpan(
                          text:
                              experience.locality!(l10n(context)).toUpperCase(),
                        ),
                      if (experience.locality != null &&
                          experience.workingType != null)
                        const TextSpan(
                          text: dashWithSpacingString,
                        ),
                      if (experience.workingType != null)
                        TextSpan(
                          text: experience.workingType!
                              .label(l10n(context))
                              .toUpperCase(),
                        ),
                    ],
                  ),
                ),
              ],
              if (experience.description != null) ...[
                smallMarginGap,
                AppMarkdown(
                  data: experience.description!(l10n(context)),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

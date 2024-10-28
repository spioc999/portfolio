import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/ui/components/app_markdown.dart';
import 'package:spioc_portfolio/ui/components/at_place_clickable.dart';
import 'package:spioc_portfolio/ui/components/logo_squared_network_image.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_time_bounded_layout.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class EducationItem extends StatelessWidget {
  final Education education;
  final Function(String) onLinkTap;

  const EducationItem({
    super.key,
    required this.education,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.extraLargeMargin),
      child: PortfolioTimeBoundedLayout(
        startDateTime: education.startDateTime,
        endDateTime: education.endDateTime,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoSquaredNetworkImage.experience(
              imgUrl: education.instituteImageUrl ?? emptyString,
            ),
            defaultMarginGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    education.degree(l10n(context)).toUpperCase(),
                    style: ResponsiveValues.themeTitleStyle(context)?.copyWith(
                      height: Dimens.one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  smallMarginGap,
                  AtPlaceClickable(
                    place: education.institute(l10n(context)),
                    link: education.instituteUrl,
                    onLinkTap: onLinkTap,
                    style: ResponsiveValues.themeBodyStyle(context),
                  ),
                  if (education.grade != null) ...[
                    smallMarginGap,
                    Text(
                      l10n(context).educationview_grade_label(
                        education.grade!(l10n(context)),
                      ),
                      style: ResponsiveValues.themeBodyStyle(context)?.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  if (education.description != null) ...[
                    smallMarginGap,
                    AppMarkdown(
                      data: education.description!(l10n(context)),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/ui/components/app_markdown.dart';
import 'package:spioc_portfolio/ui/components/institute_widget.dart';
import 'package:spioc_portfolio/ui/components/logo_squared_network_image.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_time_bounded_layout.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class EducationItem extends StatefulWidget {
  final Education education;
  final Function(String) onLinkTap;

  const EducationItem({
    super.key,
    required this.education,
    required this.onLinkTap,
  });

  @override
  State<EducationItem> createState() => _EducationItemState();
}

class _EducationItemState extends State<EducationItem> {
  Education get _education => widget.education;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.extraLargeMargin),
      child: PortfolioTimeBoundedLayout(
        startDateTime: _education.startDateTime,
        endDateTime: _education.endDateTime,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoSquaredNetworkImage.experience(
              imgUrl: _education.instituteImageUrl ?? emptyString,
            ),
            defaultMarginGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _education.degree(l10n).toUpperCase(),
                    style: ResponsiveValues.themeTitleStyle(context)?.copyWith(
                      height: Dimens.one,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  smallMarginGap,
                  AtPlaceClickable(
                    place: _education.institute(l10n),
                    link: _education.instituteUrl,
                    onLinkTap: widget.onLinkTap,
                    style: ResponsiveValues.themeBodyStyle(context),
                  ),
                  if (_education.grade != null) ...[
                    smallMarginGap,
                    Text(
                      l10n.educationview_grade_label(_education.grade!(l10n)),
                      style: ResponsiveValues.themeBodyStyle(context)?.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  if (_education.description != null) ...[
                    smallMarginGap,
                    AppMarkdown(
                      data: _education.description!(l10n),
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

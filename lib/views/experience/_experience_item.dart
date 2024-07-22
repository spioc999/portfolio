import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/experience.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_time_bounded_layout.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class ExperienceItem extends StatelessWidget {
  final Experience experience;

  const ExperienceItem({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.extraLargeMargin),
      child: PortfolioTimeBoundedLayout(
        startDateTime: experience.startDateTime,
        endDateTime: experience.endDateTime,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.role(l10n(context)),
              style: ResponsiveValues.themeHeadingStyle(context)?.copyWith(
                height: Dimens.one,
              ),
            ),
            smallMarginGap,
            Text(
              experience.company,
              style: ResponsiveValues.themeBodyStyle(context),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/models.dart';
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
  bool onHoverInstituteName = false;

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
                  Text.rich(
                    TextSpan(
                      style: ResponsiveValues.themeBodyStyle(context),
                      children: [
                        const TextSpan(text: '@ '),
                        TextSpan(
                          text: _education.institute(l10n),
                          style: onHoverInstituteName
                              ? const TextStyle(
                                  decoration: TextDecoration.underline)
                              : null,
                          onEnter: (_) =>
                              setState(() => onHoverInstituteName = true),
                          onExit: (_) =>
                              setState(() => onHoverInstituteName = false),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => widget.onLinkTap(_education.instituteUrl),
                        ),
                      ],
                    ),
                  ),
                  smallMarginGap,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

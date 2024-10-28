import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/experience.dart';
import 'package:spioc_portfolio/ui/components/app_markdown.dart';
import 'package:spioc_portfolio/ui/components/logo_squared_network_image.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_time_bounded_layout.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class ExperienceItem extends StatefulWidget {
  final Experience experience;
  final Function(String) onLinkTap;

  const ExperienceItem({
    super.key,
    required this.experience,
    required this.onLinkTap,
  });

  @override
  State<ExperienceItem> createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  bool onHoverCompanyName = false;

  Experience get _experience => widget.experience;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.extraLargeMargin),
      child: PortfolioTimeBoundedLayout(
        startDateTime: _experience.startDateTime,
        endDateTime: _experience.endDateTime,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoSquaredNetworkImage.experience(
              imgUrl: _experience.companyImageUrl ?? emptyString,
            ),
            defaultMarginGap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _experience.role(l10n).toUpperCase(),
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
                          text: _experience.company,
                          style: onHoverCompanyName
                              ? const TextStyle(
                                  decoration: TextDecoration.underline)
                              : null,
                          onEnter: (_) =>
                              setState(() => onHoverCompanyName = true),
                          onExit: (_) =>
                              setState(() => onHoverCompanyName = false),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => widget.onLinkTap(_experience.companyUrl),
                        ),
                      ],
                    ),
                  ),
                  if (_experience.locality != null ||
                      _experience.workingType != null) ...[
                    verySmallMarginGap,
                    Text.rich(
                      TextSpan(
                        style: ResponsiveValues.themeLabelStyle(context),
                        children: [
                          if (widget.experience.locality != null)
                            TextSpan(
                              text: _experience.locality!(l10n).toUpperCase(),
                            ),
                          if (_experience.locality != null &&
                              _experience.workingType != null)
                            const TextSpan(
                              text: dashWithSpacingString,
                            ),
                          if (_experience.workingType != null)
                            TextSpan(
                              text: _experience.workingType!
                                  .label(l10n)
                                  .toUpperCase(),
                            ),
                        ],
                      ),
                    ),
                  ],
                  if (_experience.description != null) ...[
                    smallMarginGap,
                    AppMarkdown(
                      data: _experience.description!(l10n),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

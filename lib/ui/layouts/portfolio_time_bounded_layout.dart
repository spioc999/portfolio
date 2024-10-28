import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:intl/intl.dart';
import 'package:spioc_portfolio/utils/extensions.dart';
import 'package:spioc_portfolio/utils/responsive_values.dart';

class PortfolioTimeBoundedLayout extends StatelessWidget {
  final DateTime startDateTime;
  final DateTime? endDateTime;
  final Widget child;
  final double opacityTimeBounds;

  const PortfolioTimeBoundedLayout({
    super.key,
    required this.startDateTime,
    required this.endDateTime,
    required this.child,
    this.opacityTimeBounds = 0.85,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Opacity(
            opacity: opacityTimeBounds,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: _startDateString(context).toUpperCase(),
                  ),
                  const TextSpan(text: dashWithSpacingString),
                  TextSpan(
                    text: _endDateString(context).toUpperCase(),
                    style: endDateTime == null
                        ? TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          )
                        : null,
                  ),
                ],
              ),
              style: ResponsiveValues.themeLabelStyle(context),
            ),
          ),
        ),
        defaultMarginGap,
        Expanded(flex: 3, child: child),
      ],
    );
  }

  String _startDateString(BuildContext context) {
    final dateFormatString = startDateTime.year == endDateTime?.year
        ? dateFormatMonth
        : dateFormatMonthAndYear;

    return DateFormat(
      dateFormatString,
      Localizations.localeOf(context).languageCode,
    ).format(startDateTime);
  }

  String _endDateString(BuildContext context) {
    if (endDateTime == null) return l10n(context).generic_present;

    return DateFormat(
      dateFormatMonthAndYear,
      Localizations.localeOf(context).languageCode,
    ).format(endDateTime!);
  }
}

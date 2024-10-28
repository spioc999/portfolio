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
    this.opacityTimeBounds = 0.65,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Opacity(
            opacity: opacityTimeBounds,
            child: Text(
              '${_startDateString(context)}$dashWithSpacingString${_endDateString(context)}'
                  .toUpperCase(),
              style: ResponsiveValues.themeLabelStyle(context),
            ),
          ),
        ),
        defaultMarginGap,
        Expanded(flex: 10, child: child),
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

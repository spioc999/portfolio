import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/dimens.dart';
import 'package:spioc_portfolio/models/models.dart';
import 'package:spioc_portfolio/ui/layouts/portfolio_time_bounded_layout.dart';

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.extraLargeMargin),
      child: PortfolioTimeBoundedLayout(
        startDateTime: widget.education.startDateTime,
        endDateTime: widget.education.endDateTime,
        child: Container(),
      ),
    );
  }
}

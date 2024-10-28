import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

class PortfolioResponsiveTitleAndContentLayout extends StatelessWidget {
  final double topMargin;
  final Widget title;
  final Widget content;

  const PortfolioResponsiveTitleAndContentLayout({
    super.key,
    required this.title,
    required this.content,
    this.topMargin = Dimens.superGigantMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topMargin),
      child: ScreenTypeLayout.builder(
        mobile: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: title,
            ),
            defaultMarginGap,
            content,
          ],
        ),
        desktop: (_) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: title,
            ),
            largeMarginGap,
            Expanded(
              flex: 3,
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}

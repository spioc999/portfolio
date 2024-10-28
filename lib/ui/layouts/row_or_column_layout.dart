import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

class RowOrColumnLayout extends StatelessWidget {
  final Widget first;
  final Widget second;
  final double margin;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  const RowOrColumnLayout({
    super.key,
    required this.first,
    required this.second,
    this.margin = Dimens.defaultMargin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: _columnLayout,
      desktop: _rowLayout,
      tablet: _rowLayout,
    );
  }

  Widget _rowLayout(BuildContext context) => Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          first,
          _gap,
          Expanded(child: second),
        ],
      );

  Widget _columnLayout(BuildContext context) => Column(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          first,
          _gap,
          second,
        ],
      );

  Gap get _gap => Gap(margin);
}

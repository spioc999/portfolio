import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

class AppDivider extends StatelessWidget {
  final double width;
  final double height;

  const AppDivider.vertical({
    super.key,
    this.width = Dimens.defaultDividerThickness,
    this.height = double.infinity,
  });

  const AppDivider.horizontal({
    super.key,
    this.width = double.infinity,
    this.height = Dimens.defaultDividerThickness,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dividerColor,
      height: height,
      width: width,
    );
  }
}

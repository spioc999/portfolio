import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double width;
  final double height;

  const AppDivider.vertical(
      {super.key, this.width = 1.0, this.height = double.infinity});

  const AppDivider.horizontal(
      {super.key, this.width = double.infinity, this.height = 1.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).dividerColor,
      height: height,
      width: width,
    );
  }
}

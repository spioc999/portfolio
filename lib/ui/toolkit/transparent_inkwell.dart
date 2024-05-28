import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

class TransparentInkWell extends StatelessWidget {
  final WidgetStatesController? statesController;
  final Widget child;
  final BorderRadius? borderRadius;
  final GestureTapCallback? onTap;

  const TransparentInkWell({
    required this.child,
    required this.onTap,
    this.borderRadius,
    this.statesController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      radius: Dimens.zero,
      borderRadius: borderRadius,
      statesController: statesController,
      onTap: onTap,
      child: child,
    );
  }
}

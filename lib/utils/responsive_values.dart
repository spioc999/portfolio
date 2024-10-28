import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

class ResponsiveValues {
  static EdgeInsetsGeometry bodyPadding(BuildContext context) =>
      getValueForScreenType(
        context: context,
        mobile: defaultBodyPadding,
        tablet: tabletBodyPadding,
        desktop: _desktopDynamicBodyPadding(context),
      );

  static EdgeInsetsGeometry _desktopDynamicBodyPadding(BuildContext context) =>
      EdgeInsets.symmetric(
        horizontal: max(
          Dimens.horizontalPaddingDesktop,
          (MediaQuery.sizeOf(context).width - Dimens.maxContentWidth) / 2,
        ),
        vertical: Dimens.verticalPaddingDefault,
      );

  static TextStyle? themeDisplayStyle(BuildContext context) =>
      getValueForScreenType(
        context: context,
        mobile: Theme.of(context).textTheme.displayMedium,
        tablet: Theme.of(context).textTheme.displayLarge,
        desktop: Theme.of(context).textTheme.displayLarge,
      );

  static TextStyle? themeTitleStyle(BuildContext context) =>
      getValueForScreenType(
        context: context,
        mobile: Theme.of(context).textTheme.titleMedium,
        tablet: Theme.of(context).textTheme.titleLarge,
        desktop: Theme.of(context).textTheme.titleLarge,
      );

  static TextStyle? themeHeadingStyle(BuildContext context) =>
      getValueForScreenType(
        context: context,
        mobile: Theme.of(context).textTheme.headlineMedium,
        tablet: Theme.of(context).textTheme.headlineLarge,
        desktop: Theme.of(context).textTheme.headlineLarge,
      );

  static TextStyle? themeBodyStyle(BuildContext context) =>
      getValueForScreenType(
        context: context,
        mobile: Theme.of(context).textTheme.bodyMedium,
        tablet: Theme.of(context).textTheme.bodyLarge,
        desktop: Theme.of(context).textTheme.bodyLarge,
      );

  static TextStyle? themeLabelStyle(BuildContext context) =>
      getValueForScreenType(
        context: context,
        mobile: Theme.of(context).textTheme.labelMedium,
        tablet: Theme.of(context).textTheme.labelLarge,
        desktop: Theme.of(context).textTheme.labelLarge,
      );

  static double smallImageSize(BuildContext context) => getValueForScreenType(
        context: context,
        mobile: Dimens.defaultSmallImageSize,
        tablet: Dimens.defaultSmallImageSize + Dimens.largeMargin,
        desktop: Dimens.defaultSmallImageSize + Dimens.largeMargin,
      );

  static WrapAlignment wrapAlignment(BuildContext context) =>
      getValueForScreenType(
        context: context,
        mobile: WrapAlignment.center,
        tablet: WrapAlignment.center,
        desktop: WrapAlignment.start,
      );

  static CrossAxisAlignment crossAxisAlignment(BuildContext context) =>
      getValueForScreenType(
        context: context,
        mobile: CrossAxisAlignment.center,
        tablet: CrossAxisAlignment.center,
        desktop: CrossAxisAlignment.start,
      );
}

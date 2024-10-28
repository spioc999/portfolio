import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveHelper {
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
}

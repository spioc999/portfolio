import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/common.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

class PortfolioAppTheming {
  static const headingFontFamily = 'Bebas Neue';
  static const bodyFontFamily = 'Fira Sans Condensed';

  static TextTheme _textTheme({required bool isDark}) {
    TextStyle displayStyle(double fontSize) => TextStyle(
          fontFamily: headingFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle headlineStyle(double fontSize) => TextStyle(
          fontFamily: headingFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle titleStyle(double fontSize) => TextStyle(
          fontFamily: bodyFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle bodyStyle(double fontSize) => TextStyle(
          fontFamily: bodyFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle labelStyle(double fontSize) => TextStyle(
          fontFamily: bodyFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          color: isDark ? Colors.white : Colors.black,
        );

    return TextTheme(
      displayLarge: displayStyle(116),
      displayMedium: displayStyle(96),
      displaySmall: displayStyle(76),
      headlineLarge: headlineStyle(42),
      headlineMedium: headlineStyle(34),
      headlineSmall: headlineStyle(26),
      titleLarge: titleStyle(24),
      titleMedium: titleStyle(20),
      titleSmall: titleStyle(16),
      bodyLarge: bodyStyle(16),
      bodyMedium: bodyStyle(14),
      bodySmall: bodyStyle(12),
      labelLarge: labelStyle(12),
      labelMedium: labelStyle(10),
      labelSmall: labelStyle(8),
    );
  }

  static const minButtonSize = Size(
    Dimens.minButtonWidth,
    Dimens.minButtonHeight,
  );
  static const buttonPadding =
      EdgeInsets.symmetric(horizontal: Dimens.horizontalPaddingButton);

  static ElevatedButtonThemeData _elevatedButtonThemeData(
          {required bool isDark}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return isDark ? Colors.grey.shade700 : Colors.grey.shade300;
              }

              return isDark ? Colors.white : Colors.black;
            },
          ),
          foregroundColor: WidgetStatePropertyAll(
            isDark ? Colors.black : Colors.white,
          ),
          minimumSize: const WidgetStatePropertyAll(minButtonSize),
          padding: const WidgetStatePropertyAll(buttonPadding),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
          elevation: const WidgetStatePropertyAll(Dimens.zero),
          iconSize: const WidgetStatePropertyAll(Dimens.defaultIconSize),
        ),
      );

  static TextButtonThemeData _textButtonThemeData({required bool isDark}) =>
      TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return isDark ? Colors.grey.shade700 : Colors.grey.shade300;
              }

              return isDark ? Colors.white : Colors.black;
            },
          ),
          minimumSize: const WidgetStatePropertyAll(minButtonSize),
          padding: const WidgetStatePropertyAll(buttonPadding),
          elevation: const WidgetStatePropertyAll(Dimens.zero),
          iconSize: const WidgetStatePropertyAll(Dimens.defaultIconSize),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonThemeData(
          {required bool isDark}) =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return isDark ? Colors.grey.shade700 : Colors.grey.shade300;
              }

              return isDark ? Colors.white : Colors.black;
            },
          ),
          side: WidgetStateProperty.resolveWith(
            (states) {
              Color color;
              if (states.contains(WidgetState.disabled)) {
                color = isDark ? Colors.grey.shade700 : Colors.grey.shade300;
              } else {
                color = isDark ? Colors.white : Colors.black;
              }

              return BorderSide(color: color);
            },
          ),
          minimumSize: const WidgetStatePropertyAll(minButtonSize),
          padding: const WidgetStatePropertyAll(buttonPadding),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
          elevation: const WidgetStatePropertyAll(Dimens.zero),
          iconSize: const WidgetStatePropertyAll(Dimens.defaultIconSize),
        ),
      );

  static CardTheme _cardTheme({required bool isDark}) => CardTheme(
        elevation: Dimens.zero,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: defaultBorderRadius,
          side: BorderSide(
            color: isDark ? Colors.white : Colors.black,
            width: Dimens.one,
          ),
        ),
      );

  static ChipThemeData _chipTheme({required bool isDark}) => ChipThemeData(
      side: BorderSide(
        color: isDark ? Colors.white : Colors.black,
        width: Dimens.one,
      ),
      padding: defaultChipPadding,
      color: WidgetStatePropertyAll(isDark ? Colors.black : Colors.white));

  static final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    dividerColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: Brightness.light,
    ),
    cardTheme: _cardTheme(isDark: false),
    textTheme: _textTheme(isDark: false),
    chipTheme: _chipTheme(isDark: false),
    elevatedButtonTheme: _elevatedButtonThemeData(isDark: false),
    textButtonTheme: _textButtonThemeData(isDark: false),
    outlinedButtonTheme: _outlinedButtonThemeData(isDark: false),
  );
  static final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    dividerColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: Brightness.dark,
    ),
    cardTheme: _cardTheme(isDark: true),
    textTheme: _textTheme(isDark: true),
    chipTheme: _chipTheme(isDark: true),
    elevatedButtonTheme: _elevatedButtonThemeData(isDark: true),
    textButtonTheme: _textButtonThemeData(isDark: true),
    outlinedButtonTheme: _outlinedButtonThemeData(isDark: true),
  );
}

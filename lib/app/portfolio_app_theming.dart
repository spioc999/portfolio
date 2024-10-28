import 'package:flutter/material.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

class PortfolioAppTheming {
  static const titleFontFamily = 'Bebas Neue';
  static const bodyFontFamily = 'Fira Sans Condensed';

  static TextTheme _textTheme({required bool isDark}) {
    TextStyle displayStyle(double fontSize) => TextStyle(
          fontFamily: titleFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle headlineStyle(double fontSize) => TextStyle(
          fontFamily: titleFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle titleStyle(double fontSize) => TextStyle(
          fontFamily: titleFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
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
          color: isDark ? Colors.grey.shade200 : Colors.grey.shade800,
        );

    return TextTheme(
      displayLarge: displayStyle(120),
      displayMedium: displayStyle(100),
      displaySmall: displayStyle(80),
      headlineLarge: headlineStyle(48),
      headlineMedium: headlineStyle(40),
      headlineSmall: headlineStyle(32),
      titleLarge: titleStyle(36),
      titleMedium: titleStyle(32),
      titleSmall: titleStyle(28),
      bodyLarge: bodyStyle(18),
      bodyMedium: bodyStyle(16),
      bodySmall: bodyStyle(14),
      labelLarge: labelStyle(14),
      labelMedium: labelStyle(12),
      labelSmall: labelStyle(10),
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

  static final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    cardColor: Colors.white,
    dividerColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: Brightness.light,
    ),
    textTheme: _textTheme(isDark: false),
    elevatedButtonTheme: _elevatedButtonThemeData(isDark: false),
    textButtonTheme: _textButtonThemeData(isDark: false),
    outlinedButtonTheme: _outlinedButtonThemeData(isDark: false),
  );
  static final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    cardColor: Colors.black,
    dividerColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.greenAccent,
      brightness: Brightness.dark,
    ),
    textTheme: _textTheme(isDark: true),
    elevatedButtonTheme: _elevatedButtonThemeData(isDark: true),
    textButtonTheme: _textButtonThemeData(isDark: true),
    outlinedButtonTheme: _outlinedButtonThemeData(isDark: true),
  );
}

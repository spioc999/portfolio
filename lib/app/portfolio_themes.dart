import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spioc_portfolio/constants/dimens.dart';

class PortfolioAppThemes {
  //TODO download fonts
  static const _titleFontFamily = 'Bebas Neue';
  static const _bodyFontFamily = 'Roboto';

  static AppBarTheme _appBarTheme({required bool isDark}) => AppBarTheme(
        backgroundColor: isDark ? Colors.black : Colors.white,
        toolbarHeight: Dimens.appBarHeight,
      );

  static TextTheme _textTheme({required bool isDark}) {
    TextStyle displayStyle(double fontSize) => GoogleFonts.getFont(
          _titleFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle headlineStyle(double fontSize) => GoogleFonts.getFont(
          _titleFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle titleStyle(double fontSize) => GoogleFonts.getFont(
          _titleFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle bodyStyle(double fontSize) => GoogleFonts.getFont(
          _bodyFontFamily,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          color: isDark ? Colors.white : Colors.black,
        );

    TextStyle labelStyle(double fontSize) => GoogleFonts.getFont(
          _bodyFontFamily,
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
          textStyle: WidgetStateProperty.resolveWith(
            (states) {
              TextStyle textStyle = const TextStyle(
                fontWeight: FontWeight.bold,
              );
              if (states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.pressed)) {
                textStyle = textStyle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                );
              }

              return textStyle;
            },
          ),
          foregroundColor: WidgetStatePropertyAll(
            isDark ? Colors.black : Colors.white,
          ),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
          elevation: const WidgetStatePropertyAll(0.0),
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
          textStyle: WidgetStateProperty.resolveWith(
            (states) {
              TextStyle textStyle = const TextStyle(
                fontWeight: FontWeight.bold,
              );

              if (states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.pressed)) {
                textStyle = textStyle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                );
              }

              return textStyle;
            },
          ),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          elevation: const WidgetStatePropertyAll(0.0),
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
          textStyle: WidgetStateProperty.resolveWith(
            (states) {
              TextStyle textStyle = const TextStyle(
                fontWeight: FontWeight.bold,
              );
              if (states.contains(WidgetState.hovered) ||
                  states.contains(WidgetState.pressed)) {
                textStyle = textStyle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                );
              }

              return textStyle;
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
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder()),
          elevation: const WidgetStatePropertyAll(0.0),
        ),
      );

  static final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: _appBarTheme(isDark: false),
    cardColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    textTheme: _textTheme(isDark: false),
    elevatedButtonTheme: _elevatedButtonThemeData(isDark: false),
    textButtonTheme: _textButtonThemeData(isDark: false),
    outlinedButtonTheme: _outlinedButtonThemeData(isDark: false),
  );
  static final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: _appBarTheme(isDark: true),
    cardColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      brightness: Brightness.dark,
    ),
    textTheme: _textTheme(isDark: true),
    elevatedButtonTheme: _elevatedButtonThemeData(isDark: true),
    textButtonTheme: _textButtonThemeData(isDark: true),
    outlinedButtonTheme: _outlinedButtonThemeData(isDark: true),
  );
}

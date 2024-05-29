import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:spioc_portfolio/core/locator/locator.dart';
import 'package:spioc_portfolio/interactors/interactors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (_) => AppSettingsProvider(
      appSettingsInteractor: getIt<AppSettingsInteractor>(),
    ),
  ),
];

class AppSettingsProvider extends ChangeNotifier {
  final AppSettingsInteractor _appSettingsInteractor;
  AppSettings appSettings = AppSettings();

  AppSettingsProvider({required AppSettingsInteractor appSettingsInteractor})
      : _appSettingsInteractor = appSettingsInteractor {
    final savedThemeModeName = _appSettingsInteractor.getSavedThemeModeName();
    if (savedThemeModeName != null) {
      final savedThemeMode = ThemeMode.values.firstWhereOrNull(
        (themeMode) => themeMode.name == savedThemeModeName,
      );
      appSettings = appSettings.copyWith(themeMode: savedThemeMode);
    }

    final savedLanguageCode = _appSettingsInteractor.getSavedLanguageCode();
    if (savedThemeModeName != null) {
      final savedLocale = AppLocalizations.supportedLocales.firstWhereOrNull(
        (locale) => locale.languageCode == savedLanguageCode,
      );
      appSettings = appSettings.copyWith(locale: savedLocale);
    }
  }

  Future<void> switchThemeByBrightness(Brightness brightness) async {
    final newThemeMode =
        brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    appSettings = appSettings.copyWith(themeMode: newThemeMode);
    notifyListeners();

    await _appSettingsInteractor.saveThemeModeName(newThemeMode.name);
  }

  Future<void> switchLocale(String languageCode) async {
    final newLocale = AppLocalizations.supportedLocales
        .whereNot((locale) => locale.languageCode == languageCode)
        .first;

    appSettings = appSettings.copyWith(locale: newLocale);
    notifyListeners();

    await _appSettingsInteractor.saveLanguageCode(newLocale.languageCode);
  }
}

class AppSettings {
  ThemeMode? themeMode;
  Locale? locale;

  AppSettings({
    this.themeMode,
    this.locale,
  });

  AppSettings copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) =>
      AppSettings(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );
}

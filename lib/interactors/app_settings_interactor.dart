import 'package:spioc_portfolio/modules/modules.dart';

class AppSettingsInteractor {
  final SharedPref _sharedPref;

  AppSettingsInteractor({required SharedPref sharedPref})
      : _sharedPref = sharedPref;

  String? getSavedThemeModeName() => _sharedPref.getSavedThemeModeName();

  Future<bool> saveThemeModeName(String themeMode) =>
      _sharedPref.saveThemeModeName(themeMode);

  String? getSavedLanguageCode() => _sharedPref.getSavedLanguageCode();

  Future<bool> saveLanguageCode(String languageCode) =>
      _sharedPref.saveLanguageCode(languageCode);
}

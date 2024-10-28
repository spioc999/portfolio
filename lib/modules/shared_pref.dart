import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const _themeMode = 'themeMode';
  static const _languageCode = 'languageCode';

  late SharedPreferences _sharedPref;

  Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  String? getSavedThemeModeName() => _sharedPref.getString(_themeMode);

  Future<bool> saveThemeModeName(String themeModeName) =>
      _sharedPref.setString(_themeMode, themeModeName);

  String? getSavedLanguageCode() => _sharedPref.getString(_languageCode);

  Future<bool> saveLanguageCode(String languageCode) =>
      _sharedPref.setString(_languageCode, languageCode);
}

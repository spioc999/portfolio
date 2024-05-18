import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late SharedPreferences _sharedPref;

  Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class MyThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";
  SharedPreferences _prefs;

  setDarkTheme(bool value) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(THEME_STATUS) ?? false;
  }
}

import 'package:flutter/foundation.dart';
import 'package:vaishnavi116/utils/theme_prefernces.dart';

class DarkThemeProvider with ChangeNotifier {
  MyThemePreferences myThemePreferences = MyThemePreferences();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    myThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}

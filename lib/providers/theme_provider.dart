import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String THEME_STATUS = 'THEME_STATUS';
  bool _darkTheme = false;

  bool get isDarkTheme => _darkTheme;
  ThemeProvider() {
    getTheme();
  }
  Future<void> setDarkTheme({required bool themeValue}) async {
    _darkTheme = themeValue;
    notifyListeners(); 

    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(THEME_STATUS, _darkTheme);
  }

  Future<void> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _darkTheme = preferences.getBool(THEME_STATUS) ?? false;
    notifyListeners();
  }
}

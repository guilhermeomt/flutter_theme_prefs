import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  accentColor: Colors.grey.shade300,
  scaffoldBackgroundColor: Colors.white,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  accentColor: Colors.grey.shade700,
  scaffoldBackgroundColor: Colors.grey.shade900,
);

class ThemeSettings with ChangeNotifier {
  bool _darkTheme = false;
  SharedPreferences? _preferences;
  bool _doneLoading = false;

  bool get darkTheme => _darkTheme;
  bool get doneLoading => _doneLoading;

  ThemeSettings() {
    _loadFromPrefs();
  }

  set doneLoading(bool value) {
    _doneLoading = value;
    notifyListeners();
  }

  _initPrefs() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _preferences!.getBool('darkTheme') ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _preferences!.setBool('darkTheme', darkTheme);
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }
}

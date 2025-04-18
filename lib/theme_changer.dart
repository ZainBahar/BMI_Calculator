import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  // Initialization of the ThemeMode
  ThemeMode _themeMode = ThemeMode.light;

// Getter for the ThemeMode
  get themeMode {
    return _themeMode;
  }

// Setter for the ThemeMode
  void changeTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

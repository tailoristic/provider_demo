import 'package:flutter/material.dart';

class ThemeMan extends ChangeNotifier {
  bool isDark = false;
  bool getTheme() => isDark;
  changeTheme(bool value) {
    isDark = value;
    notifyListeners();
  }
}

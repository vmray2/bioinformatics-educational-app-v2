import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void setLightMode() => state = ThemeMode.light;

  void setDarkMode() => state = ThemeMode.dark;

  void setSystemMode() => state = ThemeMode.system;

  void toggleTheme() {
    switch (state) {
      case ThemeMode.light:
        state = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        state = ThemeMode.system;
        break;
      case ThemeMode.system:
        state = ThemeMode.light;
        break;
    }
  }
}

final themeProvider = NotifierProvider<ThemeController, ThemeMode>(() {
  return ThemeController();
});
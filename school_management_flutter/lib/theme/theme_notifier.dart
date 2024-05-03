import 'package:flutter/material.dart';

enum ThemeModeOption {
  system,
  light,
  dark,
}

class ThemeNotifier extends ValueNotifier<ThemeModeOption> {
  ThemeNotifier(super.value);

  void toggleTheme(ThemeModeOption mode) {
    value = mode;
  }
}

class FontNotifier extends ValueNotifier<double> {
  FontNotifier(super.value);

  void increaseFontSize(ThemeModeOption mode) {
    value++;
  }
}

final themeNotifier = ThemeNotifier(ThemeModeOption.system);
final fontNotifier = FontNotifier(16.0);

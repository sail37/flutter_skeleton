import 'package:flutter/material.dart';

import 'settings_preferences.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async {
    final theme = PreferenceUtils.getTheme();
    if (theme == null) {
      return ThemeMode.system;
    }
    return ThemeMode.values
        .where((element) => element.toString() == theme)
        .first;
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    PreferenceUtils.setTheme(theme.toString());
  }
}

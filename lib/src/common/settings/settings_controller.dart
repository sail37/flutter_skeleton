import 'package:flutter/material.dart';

import 'settings_service.dart';
import 'settings_preferences.dart';

class SettingsController with ChangeNotifier {
  static final SettingsController _settingsController =
      SettingsController._internal();

  factory SettingsController() {
    return _settingsController;
  }

  SettingsController._internal();

  late SettingsService _settingsService;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  void setSettings(SettingsService settingsService) {
    _settingsService = settingsService;
  }

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return PreferenceUtils.setTheme(null);
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }
}

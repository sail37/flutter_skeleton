import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/common/router/helper.dart';
import 'src/common/settings/settings_controller.dart';
import 'src/common/settings/settings_preferences.dart';
import 'src/common/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CustomNavigationHelper.instance;

  await PreferenceUtils.init();

  final settingsController = SettingsController();
  settingsController.setSettings(SettingsService());
  await settingsController.loadSettings();

  runApp(const MyApp());
}

import 'package:shared_preferences/shared_preferences.dart';

class PrefKey {
  static String get theme => 'theme_mode';
}

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static String? getTheme() {
    return _prefsInstance?.getString(PrefKey.theme);
  }

  static Future<void> setTheme(String? value) async {
    if (value == null) {
      return _prefsInstance?.remove(PrefKey.theme) ?? Future.value();
    }
    return _prefsInstance?.setString(PrefKey.theme, value) ?? Future.value();
  }
}

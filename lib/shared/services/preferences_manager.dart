import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static late SharedPreferences _preferences;

  static Future initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getString(final String key) => _preferences.getString(key);

  static Future<bool> remove(final String key) => _preferences.remove(key);

  static Future<bool> setString(final String key, final String? value) {
    if (value == null) return remove(key);
    return _preferences.setString(key, value);
  }
}

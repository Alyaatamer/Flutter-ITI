import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();
  static late SharedPreferences _sharedPreferences;

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  static String? getString(String key) {
    return _sharedPreferences.getString(key);
  }
}

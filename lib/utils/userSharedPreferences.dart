// ignore_for_file: file_names, unused_field

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyToken = 'token';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await _preferences.setString(_keyToken, token);

  static String? getToken() => _preferences.getString(_keyToken);
}

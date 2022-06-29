// ignore_for_file: file_names, unused_field

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  static const _keyToken = 'token';
  static const _keyLogin = 'login';
  static const _keyParcelUuid = 'uuid';
  static const _keyName = 'name';
  static const _keySurname = 'surname';
  static const _keyPhone = 'phone';
  static const _keyEmail = 'email';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await _preferences.setString(_keyToken, token);

  static String? getToken() => _preferences.getString(_keyToken);

  static Future setLogin(String login) async =>
      await _preferences.setString(_keyLogin, login);

  static String? getLogin() => _preferences.getString(_keyLogin);

  static Future setParcelUuid(String uuid) async =>
      await _preferences.setString(_keyParcelUuid, uuid);

  static String? getParcelUuid() => _preferences.getString(_keyParcelUuid);

  static Future setName(String name) async =>
      await _preferences.setString(_keyName, name);

  static String? getName() => _preferences.getString(_keyName);

  static Future setSurname(String surname) async =>
      await _preferences.setString(_keySurname, surname);

  static String? getSurname() => _preferences.getString(_keySurname);

  static Future setPhone(String phone) async =>
      await _preferences.setString(_keyPhone, phone);

  static String? getPhone() => _preferences.getString(_keyPhone);

  static Future setEmail(String email) async =>
      await _preferences.setString(_keyEmail, email);

  static String? getEmail() => _preferences.getString(_keyEmail);
}

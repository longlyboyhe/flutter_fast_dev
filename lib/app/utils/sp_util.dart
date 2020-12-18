import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SpUtil _instance;
  static SharedPreferences _preferences;

  factory SpUtil() => _getInstance();

  static SpUtil _getInstance() {
    if (_instance == null) {
      _instance = SpUtil._();
    }
    return _instance;
  }

  SpUtil._();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
    print("_preferences初始化完毕");
  }

  void putString(String key, String value) {
    _preferences.setString(key, value);
  }

  String getString(String key) {
    return _preferences.getString(key);
  }

  void putInt(String key, int value) {
    _preferences.setInt(key, value);
  }

  int getInt(String key) {
    return _preferences.getInt(key);
  }

  void putDouble(String key, double value) {
    _preferences.setDouble(key, value);
  }

  getDouble(String key) {
    return _preferences.getDouble(key);
  }

  putObject<T>(String key, T value) {
    _preferences.setString(key, value == null ? "" : json.encode(value));
  }

  // T getObject<T>(String key) {
  //   String value = _preferences.getString(key);
  //   if (value.isEmpty) {
  //     return null;
  //   } else {
  //     return JsonConvert.fromJsonAsT<T>(json.decode(value));
  //   }
  // }

  putBool(String key, bool value) {
    _preferences.setBool(key, value);
  }

  bool getBool(String key) {
    return _preferences.getBool(key);
  }

  clear() {
    _preferences.clear();
  }
}

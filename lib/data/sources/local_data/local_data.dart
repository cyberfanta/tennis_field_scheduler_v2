import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Int
  Future<int> getInt(String intName) async {
    return (await _prefs).getInt(intName) ?? -25000;
  }

  Future<bool> setInt(String intName, int value) async {
    return (await _prefs).setInt(intName, value);
  }

  // String
  Future<String> getString(String stringName) async {
    return (await _prefs).getString(stringName) ?? "";
  }

  Future<List<String>> getStringList(String stringName) async {
    return (await _prefs).getStringList(stringName) ?? [];
  }

  Future<bool> setString(String stringName, String value) async {
    return (await _prefs).setString(stringName, value);
  }

  Future<bool> setStringList(String stringName, List<String> value) async {
    return (await _prefs).setStringList(stringName, value);
  }
}

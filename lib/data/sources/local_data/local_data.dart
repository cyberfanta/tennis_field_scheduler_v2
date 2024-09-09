import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  // Int
  Future<int> getInt(String intName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getInt(intName) ?? -25000);
  }

  Future<bool> setInt(String intName, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.setInt(intName, value));
  }

  // String
  Future<String> getString(String stringName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString(stringName) ?? "");
  }

  Future<List<String>> getStringList(String stringName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getStringList(stringName) ?? []);
  }

  Future<bool> setString(String stringName, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.setString(stringName, value));
  }

  Future<bool> setStringList(String stringName, List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.setStringList(stringName, value));
  }
}

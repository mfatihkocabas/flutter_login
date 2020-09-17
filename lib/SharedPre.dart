import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static SharedPreferences _local;
  static Future<void> saveMail(String mail) async {
    return _local.setString('mail', mail);
  }
  static Future<void> saveName(String name) async {
    return _local.setString('name', name);
  }
  static Future<void> saveSurName(String surname) async {
    return _local.setString('surname', surname);
  }
  static Future<void> savePassword(String password) async {
    return _local.setString("password", password);
  }
  static Future<void> sharedClear() async {
    return _local.clear();
  }
  static Future<void> login() async {
    return _local.setBool('login', true);
  }


}
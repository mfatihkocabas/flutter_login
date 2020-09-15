import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';
import 'login.dart';
class SharedPrefs{
  static SharedPreferences _prefs;
  static Future<void> saveMail(String mail) async {
    return _prefs.setString('mail', mail);
  }
  static Future<void> saveName(String name) async {
    return _prefs.setString('name', name);
  }
  static Future<void> saveSurName(String surname) async {
    return _prefs.setString('surname', surname);
  }
  static Future<void> savePassword(String password) async {
    return _prefs.setString("password", password);
  }
  static Future<void> sharedClear() async {
    return _prefs.clear();
  }
  static Future<void> login() async {
    return _prefs.setBool('login', true);
  }
  static String get getMail => _prefs.getString("mail") ?? null;
  static String get getPassword => _prefs.getString("password") ?? null;
  static bool get getLogin => _prefs.getBool('login') ?? false;
}
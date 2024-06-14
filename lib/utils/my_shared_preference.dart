import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreference {
  static SharedPreferences? preferences;
  static const String key = 'userType';
  static init() async {
    preferences = await SharedPreferences.getInstance();
    return preferences;
  }

  static Future saveUserType(String type) async {
    return await preferences!.setString(key, type);
  }

  static String? getUserType() => preferences!.getString(key) ?? "";
}

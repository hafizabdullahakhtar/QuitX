import 'dart:convert';
import 'package:beinghuman/features/Authentication/Model/UserModel/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {
  static const String _userKey = 'user';

  // Load user data from local storage
  static Future<UserModel?> loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userDataJson = prefs.getString(_userKey);
    if (userDataJson != null) {
      return UserModel.fromJson(jsonDecode(userDataJson));
    }
    return null;
  }

  // Save user data to local storage
  static Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userDataJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userDataJson);
  }

  // Remove user data from local storage
  static Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}

import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const _isLoggedIn = 'isLoggedIn';
  static const _email = 'email';
  static const _password = 'password';

  static Future<void> saveUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_email, email);
    await prefs.setString(_password, password);
    await prefs.setBool(_isLoggedIn, true);
  }

  static Future<bool> loginUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString(email);
    final storedPassword = prefs.getString(password);
    if(storedEmail == null || storedPassword == null){}
    if (email == storedPassword && password == storedPassword) {
      await prefs.setBool(_isLoggedIn, true);
      return true;
    }
    return false;
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedIn) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedIn, false);
  }
}

import 'package:moviebasket/bloc/auth/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocalStorage {
  static const _isLoggedIn = 'isLoggedIn';
  static const _email = 'email';
  static const _password = 'password';
  static const _rememberMe = 'rememberMe';

  static Future<void> saveUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_email, email);
    await prefs.setString(_password, password);
    await prefs.setBool(_isLoggedIn, true);
  }

  static Future<LoginResult> loginUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString(_email);
    final storedPassword = prefs.getString(_password);
    if (storedEmail == null || storedPassword == null) {
      return LoginResult.notRegistered;
    }
    if (email == storedEmail && password == storedPassword) {
      await prefs.setBool(_isLoggedIn, true);
      return LoginResult.success;
    }
    return LoginResult.wrongCredentials;
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

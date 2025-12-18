import 'package:flutter/material.dart';
import './app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      background: AppColors.background,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      onError: Colors.white,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.primary),
      bodyMedium: TextStyle(color: AppColors.primary),
      titleLarge: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 28
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,

    colorScheme: ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkSecondary,
      surface: AppColors.darkSurface,
      background: AppColors.darkBackground,
      error: AppColors.error,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: AppColors.darkTextPrimary,
      onSurface: AppColors.darkTextPrimary,
      onError: Colors.white,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
      bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
      titleLarge: TextStyle(
        color: AppColors.darkTextPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 28
      ),
    ),
  );
}

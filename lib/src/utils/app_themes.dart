import 'package:flutter/material.dart';
import 'package:pulse/src/constants/app_colors.dart';

// themes for the app
class AppThemes {
  static ThemeData get _defaultTheme {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryOrange,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.primaryOrange),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ));
  }

  // light theme
  static final ThemeData lightTheme = _defaultTheme.copyWith(
    colorScheme: _defaultTheme.colorScheme.copyWith(
      brightness: Brightness.light,
      surface: AppColors.white,
      onSurface: AppColors.textDark,
    ),
    // text theme for the app
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textDark),
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),

    // app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.textDark,
      elevation: 0,
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.inputBackgroundLight,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    // button themes
  );

  // dark theme for the app
  static final ThemeData darkTheme = _defaultTheme.copyWith(
    colorScheme: _defaultTheme.colorScheme.copyWith(
      brightness: Brightness.dark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.textDarkMode,
    ),
    // TEXT THEME FOR THE DARK MODE
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textDarkMode),
      bodyLarge: TextStyle(color: AppColors.textDarkMode),
      bodyMedium: TextStyle(color: AppColors.textLightDarkMode),
    ),
    // APP BAR THEME FOR THE DARK MODE
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.textDarkMode,
      elevation: 0,
    ),
    // THEME FOR THE INPUT FIELDS FOR DARK MODE
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.inputBackgroundDark,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

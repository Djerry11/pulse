import 'package:flutter/material.dart';
import 'package:pulse/src/constants/app_colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_themes.g.dart';

// * themes for the app
class AppThemes {
  // * DEFAULT THEME FOR THE APP-------------------------------------
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

  // * LIGHT THEME FOR THE APP-------------------------------------
  static final ThemeData lightTheme = _defaultTheme.copyWith(
    colorScheme: _defaultTheme.colorScheme.copyWith(
      brightness: Brightness.light,
      surface: AppColors.white,
      onSurface: AppColors.textDark,
    ),
    // TEXT THEME FOR THE LIGHT MODE
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.textDark),
      bodyLarge: TextStyle(color: AppColors.textDark),
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),

    // APP BAR THEME FOR THE LIGHT MODE
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.textDark,
      elevation: 0,
    ),

    // INPUT FIELDS THEME FOR THE LIGHT MODE
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

  // */ ------------------DARK THEME FOR THE APP---------------------
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

@riverpod
class AppThemeNotifier extends _$AppThemeNotifier {
  @override
  ThemeData build() {
    const mode = ThemeMode.system;
    final currentTheme =
        mode == ThemeMode.dark ? AppThemes.darkTheme : AppThemes.lightTheme;
    return currentTheme;
  }

  void toggleTheme() {
    state = state == AppThemes.lightTheme
        ? AppThemes.darkTheme
        : AppThemes.lightTheme;
    debugPrint('Theme toggled: ${state.brightness}');
  }

  void setDarkTheme() {
    state = AppThemes.darkTheme;
  }

  void setLightTheme() {
    state = AppThemes.lightTheme;
  }

  void setSystemTheme(ThemeMode mode) {
    state = mode == ThemeMode.dark ? AppThemes.darkTheme : AppThemes.lightTheme;
  }
}

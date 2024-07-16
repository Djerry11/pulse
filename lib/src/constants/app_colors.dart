import 'package:flutter/material.dart';

class AppColors {
  static const Color lightPrimary = Color.fromARGB(255, 248, 157, 36);
  static const Color darkPrimary = Color.fromARGB(255, 248, 89, 55);
  static const Color primaryTheme = Color.fromARGB(255, 247, 135, 42);
  // Light mode colors
  static const Color primaryOrange = primaryTheme;
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color textDark = Color(0xFF262626);
  static const Color textLight = Color(0xFF8E8E8E);
  static const Color inputBackgroundLight = Color(0xFFF0F0F0);
  static const Color white = Color(0xFFFFFFFF);

  // Dark mode colors
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Colors.black;
  // static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color textDarkMode = Color(0xFFE0E0E0);
  static const Color textLightDarkMode = Color(0xFFB0B0B0);
  static const Color inputBackgroundDark = Color(0xFF2C2C2C);
}

class TextColors {
  static const Color highDarkText = Color(0xFF424242); //shade 800
  static const Color mediumDarkText = Color(0xFF616161);
  static const Color lowDarkText = Color(0xFF757575);

  static const Color highLightText = Colors.white;
  static const Color mediumLightText = Color.fromRGBO(245, 245, 245, 1);
  static const Color lowLightText = Color.fromRGBO(224, 224, 224, 1);
}

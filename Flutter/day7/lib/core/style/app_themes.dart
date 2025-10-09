import 'package:day7/core/style/app_color.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color(0xff121212),
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontFamily: 'Inter',
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      surface: Colors.white,
      onSurface: Colors.black,
      onPrimary: Colors.white,
    ),
    fontFamily: 'Inter',
  );
}

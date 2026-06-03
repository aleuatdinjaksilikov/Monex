import 'package:flutter/material.dart';

class AppTheme {
  //Light Theme
  static ThemeData lightMode = ThemeData(
    brightness: .light,
    primaryColor: Color(0xffffffff),
    scaffoldBackgroundColor: Color.fromARGB(255, 235, 239, 243),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xffffffff),
      secondary: Color(0xffffffff),
      error: Color(0xffff0000),
      surface: Color.fromARGB(255, 235, 239, 243),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 235, 239, 243),
      centerTitle: false,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.blueAccent.withValues(alpha: 0.5),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent.withValues(alpha: 0.7)
    )
  );

  //Dark Theme
  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xffffffff),
      onPrimary: Color(0xff030213),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff030213),
      error: Color(0xffff0000),
      onError: Color(0xffffffff),
      surface: Color(0xffeceef2),
      onSurface: Color(0xff717182),
    ),
  );
}

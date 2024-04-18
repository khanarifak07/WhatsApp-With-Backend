import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Color(0xff111b21),
    secondary: Color(0xff005c4b),
    tertiary: Color(0xff53bdeb),
    inversePrimary: Color(0xff8696a0),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xff111b21),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.red, // Example background color for TextButton
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Color(0xff1f2c34),
  ),
  scaffoldBackgroundColor: const Color(0xff111b21),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Color(0xff1dc261)),
  fontFamily: "OpenSans",
);

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light()
);

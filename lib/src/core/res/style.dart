import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    backgroundColor: const Color.fromARGB(255, 237, 235, 219),
    primaryColor: const Color.fromARGB(255, 80, 78, 189),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      headline4: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color.fromARGB(255, 43, 41, 163),
      backgroundColor: const Color.fromARGB(255, 49, 49, 47),
      textTheme: const TextTheme(
        headline4: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255)),
      ));
}

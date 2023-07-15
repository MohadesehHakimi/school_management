import 'package:flutter/material.dart';

ThemeData preferredThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.blue,
      secondary: Colors.blueAccent,
    ),

    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        color: Colors.black,
      ),
    ),
  );
}
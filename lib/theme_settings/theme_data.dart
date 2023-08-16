import 'package:flutter/material.dart';

ThemeData preferredThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 21, 113, 236),
      secondary: const Color.fromARGB(255, 29, 150, 241),
    ),

    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.white,
      elevation: 10.0,
      contentTextStyle: TextStyle(
        fontSize: 18.0,
        color: Color.fromARGB(255, 29, 150, 241),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
    ),

    fontFamily: 'Inter',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.0,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
      ),
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
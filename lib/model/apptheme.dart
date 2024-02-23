import 'package:flutter/material.dart';

class AppTheme {
  final ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.yellow,
        ),
        // scaffoldBackgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey.shade200,
        iconTheme: const IconThemeData(color: Colors.blue),
        textTheme: const TextTheme(
          ///For Onboarding HeadText
          displayLarge: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.black,
          ),

          ///For Onboarding SubText
          displayMedium: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.grey,
          ),

          ///For Onboarding button
          displaySmall: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              color: Colors.white),

          bodyLarge: TextStyle(fontSize: 16, color: Colors.grey),
          titleLarge: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  ThemeData get darkTheme => ThemeData.dark().copyWith(
    // primarySwatch: Colors.purple,
    brightness: Brightness.dark,
    // scaffoldBackgroundColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.grey.shade900,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.brown,
    ),
    iconTheme: const IconThemeData(color: Colors.blue),
    textTheme: TextTheme(
      ///For Onboarding HeadText
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.white,
      ),

      ///For Onboarding SubText
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        color: Colors.grey,
      ),

      ///For Onboarding button
      displaySmall: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 15,
          color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.grey[200]),
      titleLarge: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

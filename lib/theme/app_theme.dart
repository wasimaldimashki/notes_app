import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: const Color.fromARGB(233, 255, 255, 255),
    textTheme: sharedTextTheme(Colors.black),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    fontFamily: 'Poppins',
    visualDensity: VisualDensity.standard,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.amber,
      onPrimary: Colors.yellow,
      primary: Colors.amber,
    ),
    iconTheme: const IconThemeData(
      color: Colors.amber,
      size: 24,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.all(16),
      iconColor: Colors.red,
    ),
    primarySwatch: Colors.blue,
    useMaterial3: true,
  );

  static TextTheme sharedTextTheme(Color color) {
    return TextTheme(
      bodyLarge: TextStyle(color: color, letterSpacing: 1, fontSize: 18),
      bodyMedium: TextStyle(color: color, letterSpacing: 1, fontSize: 16),
      bodySmall: TextStyle(color: color, letterSpacing: 1, fontSize: 14),
      titleLarge: TextStyle(color: color, letterSpacing: 1, fontSize: 20),
      titleMedium: TextStyle(color: color, letterSpacing: 1, fontSize: 18),
      titleSmall: TextStyle(color: color, letterSpacing: 1, fontSize: 16),
      displayLarge: TextStyle(color: color, letterSpacing: 1, fontSize: 24),
      displayMedium: TextStyle(color: color, letterSpacing: 1, fontSize: 22),
      displaySmall: TextStyle(color: color, letterSpacing: 1, fontSize: 20),
      headlineLarge: TextStyle(color: color, letterSpacing: 1, fontSize: 22),
      headlineMedium: TextStyle(color: color, letterSpacing: 1, fontSize: 20),
      headlineSmall: TextStyle(color: color, letterSpacing: 1, fontSize: 18),
    );
  }
}

class DarkTheme {
  static final ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurpleAccent,
    scaffoldBackgroundColor: Colors.grey[900],
    cardColor: Colors.grey[800],
    textTheme: LightTheme.sharedTextTheme(Colors.white),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.all(16),
      iconColor: Colors.red,
    ),
    iconTheme: const IconThemeData(
      color: Colors.amber,
      size: 24,
    ),
  );
}

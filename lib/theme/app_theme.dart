import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: const Color.fromARGB(233, 255, 255, 255),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, letterSpacing: 1),
      bodyMedium: TextStyle(color: Colors.black, letterSpacing: 1),
      titleLarge: TextStyle(color: Colors.black, letterSpacing: 1),
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    fontFamily: 'Poppins',
    visualDensity: VisualDensity.standard,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
    iconTheme: const IconThemeData(
      color: Colors.amber,
      size: 24,
    ),
    listTileTheme: const ListTileThemeData(
      // tileColor: Colors.white70,
      // selectedTileColor: Colors.white70,
      contentPadding: EdgeInsets.all(16),
      iconColor: Colors.red,
      // selectedColor: Colors.white60,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    primarySwatch: Colors.blue,
    useMaterial3: true,
  );
}

class DarkTheme {
  static final ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurpleAccent,
    scaffoldBackgroundColor: Colors.grey[900],
    cardColor: Colors.grey[800],
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, letterSpacing: 1),
      bodyMedium: TextStyle(color: Colors.white, letterSpacing: 1),
      bodySmall: TextStyle(color: Colors.white, letterSpacing: 1),
      titleLarge: TextStyle(color: Colors.white, letterSpacing: 1),
      titleMedium: TextStyle(color: Colors.white, letterSpacing: 1),
      titleSmall: TextStyle(color: Colors.white, letterSpacing: 1),
      displayLarge: TextStyle(color: Colors.white, letterSpacing: 1),
      displayMedium: TextStyle(color: Colors.white, letterSpacing: 1),
      displaySmall: TextStyle(color: Colors.white, letterSpacing: 1),
      headlineLarge: TextStyle(color: Colors.white, letterSpacing: 1),
      headlineMedium: TextStyle(color: Colors.white, letterSpacing: 1),
      headlineSmall: TextStyle(color: Colors.white, letterSpacing: 1),
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    listTileTheme: const ListTileThemeData(
      // tileColor: Colors.grey[600],
      // selectedTileColor: Colors.white,
      contentPadding: EdgeInsets.all(16),
      iconColor: Colors.red,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}

import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: Colors.amber,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    fontFamily: 'Lato',
    visualDensity: VisualDensity.standard,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
    iconTheme: const IconThemeData(
      color: Colors.amber,
      size: 24,
    ),
    listTileTheme: const ListTileThemeData(
      // tileColor: AppColor.darkBlue,
      // selectedTileColor: AppColor.darkBlue,
      // contentPadding: EdgeInsets.all(16),
      iconColor: Colors.amber,
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
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.deepPurpleAccent,
    ),
  );
}

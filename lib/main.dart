import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/views/home.dart';
import 'package:notes_app/theme/app_theme.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeEnum>(
        builder: (context, themeMode) {
          final ThemeData themeData = themeMode == ThemeModeEnum.Light
              ? LightTheme.themeData
              : DarkTheme.themeData;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Notes Application',
            theme: themeData,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

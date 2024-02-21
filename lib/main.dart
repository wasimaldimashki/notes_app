import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/theme/app_theme.dart';
import 'package:notes_app/views/home.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
      ],
      child: Builder(
        builder: (context) {
          return BlocBuilder<ThemeCubit, ThemeModeEnum>(
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
          );
        },
      ),
    );
  }
}

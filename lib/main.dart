import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/core/models/text_model.dart';
import 'package:notes_app/core/shared/cash_manager.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/cubits/view_cubit/view_cubit.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/theme/app_theme.dart';
import 'package:notes_app/views/home.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashNetwork.cashInitialization();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(TextModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  await Hive.openBox<TextModel>(kTextBox);
  Bloc.observer = SimpleBlocObserver();

  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );

  HydratedBloc.storage = storage;

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
        BlocProvider<NotesCubit>(
          create: (context) => NotesCubit()
            ..fetchAllNotes()
            ..fetchAllTexts(),
        ),
        BlocProvider<AddNoteCubit>(create: (context) => AddNoteCubit()),
        BlocProvider(create: (_) => ViewCubit()),
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

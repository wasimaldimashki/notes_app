import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/screens/notes_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        leading: InkWell(
          onTap: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          child: BlocBuilder<ThemeCubit, ThemeModeEnum>(
            builder: (context, themeMode) {
              return Icon(
                themeMode == ThemeModeEnum.Dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              );
            },
          ),
        ),
      ),
      body: const NotesView(),
    );
  }
}

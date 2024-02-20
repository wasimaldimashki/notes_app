import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/screens/notes_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        leading: IconButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          icon: const Icon(Icons.light_mode),
        ),
      ),
      body: const NotesView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/views/edit_note.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeEnum>(
      builder: (context, themeMode) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const EditNote();
                  },
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 24, top: 24, left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: themeMode == ThemeModeEnum.Dark
                    ? Colors.grey[600]
                    : Colors.white70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    title: Text(
                      'Flutter tips',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        'Build yore career with wasim aldimashki',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    trailing: IconButton(
                      tooltip: 'Remove Note',
                      onPressed: () {},
                      icon: const Icon(Icons.delete, size: 28),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Text(
                      'May 21 , 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/views/edit_note.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;
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
                      note.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        note.subTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    trailing: IconButton(
                      tooltip: 'Remove Note',
                      onPressed: () {
                        note.delete();
                      },
                      icon: const Icon(Icons.delete, size: 28),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Text(
                      note.date,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/views/edit_note.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeEnum>(
      builder: (context, themeMode) {
        // ignore: unnecessary_null_comparison
        var noteColor = note.color != null
            ? Color(note.color)
            : themeMode == ThemeModeEnum.Dark
                ? Colors.grey[600]
                : Colors.white70;

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditNote(note: note);
                  },
                ),
              );
            },
            child: Dismissible(
              key: Key(note.title),
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                ),
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 50.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              secondaryBackground: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 50.0),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              confirmDismiss: (direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Deletion'),
                      content: const Text(
                          'Are you sure you want to delete this note?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                // Your delete logic
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 24, top: 24, left: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: noteColor,
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
          ),
        );
      },
    );
  }
}

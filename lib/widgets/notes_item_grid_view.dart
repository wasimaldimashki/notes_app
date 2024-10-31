import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/views/edit_note.dart';

class NotesItemGridView extends StatelessWidget {
  const NotesItemGridView({
    super.key,
    required this.note,
    required this.isSelected,
    required this.onLongPress,
    required this.onTap,
  });

  final NoteModel note;
  final bool isSelected;
  final VoidCallback onLongPress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeEnum>(
      builder: (context, themeMode) {
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
            onLongPress: onLongPress,
            child: Container(
              padding: const EdgeInsets.only(bottom: 24, top: 24, left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: isSelected ? Colors.blue.withOpacity(0.5) : noteColor,
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
        );
      },
    );
  }
}

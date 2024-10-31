import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/no_notes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/widgets/notes_item_grid_view.dart';

class NotesGridView extends StatefulWidget {
  const NotesGridView({super.key, required this.mediaQuery});
  final Size mediaQuery;

  @override
  _NotesGridViewState createState() => _NotesGridViewState();
}

class _NotesGridViewState extends State<NotesGridView> {
  List<NoteModel> selectedNotes = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        if (state is NotesNoData) {
          return const NoNotes(
            text: 'No Notes Available \n Add Notes To see',
            icon: Icons.note_add_rounded,
          );
        }

        return Scaffold(
          appBar: selectedNotes.isNotEmpty
              ? AppBar(
                  title: Text('${selectedNotes.length} selected'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteSelectedNotes();
                      },
                    ),
                  ],
                )
              : null,
          body: MasonryGridView.count(
            crossAxisCount: widget.mediaQuery.width > 600 ? 3 : 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NotesItemGridView(
                note: notes[index],
                isSelected: selectedNotes.contains(notes[index]),
                onLongPress: () {
                  _onNoteLongPressed(notes[index]);
                },
                onTap: () {
                  if (selectedNotes.isNotEmpty) {
                    _onNoteLongPressed(notes[index]);
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  void _onNoteLongPressed(NoteModel note) {
    setState(() {
      if (selectedNotes.contains(note)) {
        selectedNotes.remove(note);
      } else {
        selectedNotes.add(note);
      }
    });
  }

  void _deleteSelectedNotes() {
    for (var note in selectedNotes) {
      note.delete();
    }
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    setState(() {
      selectedNotes.clear();
    });
  }
}

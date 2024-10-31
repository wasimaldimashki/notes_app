import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/no_notes.dart';
import 'package:notes_app/widgets/note_item_list_view.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key, required this.mediaQuery});
  final Size mediaQuery;
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
        return ListView.builder(
          itemCount: notes.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: NotesItemListView(
                note: notes[index],
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  String? titleEditNote, contentEditNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        actions: [
          IconButton(
            onPressed: () {
              widget.note.title = titleEditNote ?? widget.note.title;
              widget.note.subTitle = contentEditNote ?? widget.note.subTitle;
              // print('THe title is : $titleEditNote');
              // print('THe title is : $contentEditNote');
              widget.note.save();
              Navigator.pop(context);
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            },
            icon: const Icon(Icons.done),
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'edit title',
                labelText: 'Title',
                initialValue: widget.note.title,
                icon: Icons.title,
                onChange: (value) {
                  titleEditNote = value;
                },
              ),
              const SizedBox(height: 25),
              CustomTextField(
                hintText: 'edit content',
                labelText: 'Content',
                initialValue: widget.note.subTitle,
                icon: Icons.content_paste,
                maxLines: 5,
                onChange: (value) {
                  contentEditNote = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

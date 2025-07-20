import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/core/models/text_model.dart';

import '../../core/models/note_model.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesCubitInitial());

  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());

    if (notes!.isEmpty) {
      emit(NotesNoData());
    }
  }

  List<TextModel>? text;
  fetchAllTexts() async {
    var notesBox = Hive.box<TextModel>(kTextBox);
    text = notesBox.values.toList();
    print(text![0].title);
    print(text![1].title);
    emit(NotesSuccess());

    if (notes!.isEmpty) {
      emit(NotesNoData());
    }
  }
}

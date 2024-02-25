part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesCubitInitial extends NotesState {}

final class NotesSuccess extends NotesState {}
//   final List<NoteModel> notes;

//   NotesSuccess({required this.notes});
// }

// final class NotesCubitFailure extends NotesState {
//   final String errorMessage;

//   NotesCubitFailure({required this.errorMessage});
// }

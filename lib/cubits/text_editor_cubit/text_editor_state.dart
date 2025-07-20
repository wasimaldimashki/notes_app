part of 'text_editor_cubit.dart';

@immutable
sealed class TextEditorState {}

final class TextEditorInitial extends TextEditorState {}

final class TextEditorLoading extends TextEditorState {}

final class TextEditorSuccess extends TextEditorState {}

final class TextEditorFailure extends TextEditorState {
  final String errorMessage;

  TextEditorFailure({required this.errorMessage});
}

final class AddTextColorChanged extends TextEditorState {
  final Color color;

  AddTextColorChanged({required this.color});
}

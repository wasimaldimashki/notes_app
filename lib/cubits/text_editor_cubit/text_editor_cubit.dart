import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/core/models/text_model.dart';
import 'package:quill_html_editor_v2/quill_html_editor_v2.dart';
part 'text_editor_state.dart';

class TextEditorCubit extends Cubit<TextEditorState> {
  TextEditorCubit() : super(TextEditorInitial());
  final TextEditingController titleController = TextEditingController();
  QuillEditorController quillController = QuillEditorController();
  TextModel? textModel;

  Color color =
      ThemeData.dark() == true ? Colors.grey.shade600 : Colors.white70;
  void setColor(Color newColor) {
    color = newColor;
    emit(AddTextColorChanged(color: color));
  }

  addText(TextModel text) async {
    text.color = color.value;
    emit(TextEditorLoading());
    try {
      var textBox = Hive.box<TextModel>(kTextBox);
      await textBox.add(text);
      emit(TextEditorSuccess());
    } catch (e) {
      emit(TextEditorFailure(errorMessage: e.toString()));
    }
  }

  ///[getHtmlText] to get the html text from editor
  void getHtmlText() async {
    String? htmlText = await quillController.getText();
    debugPrint(htmlText);
  }

  ///[setHtmlText] to set the html text to editor
  Future<void> setHtmlText() async {
    print('eeeee${textModel!.content}');
    await quillController.setText(textModel!.content);
  }

  final customToolBarList = [
    ToolBarStyle.undo,
    ToolBarStyle.align,
    ToolBarStyle.background,
    ToolBarStyle.bold,
    ToolBarStyle.color,
    ToolBarStyle.directionLtr,
    ToolBarStyle.directionRtl,
    ToolBarStyle.editTable,
    ToolBarStyle.headerOne,
    ToolBarStyle.headerTwo,
    ToolBarStyle.italic,
    ToolBarStyle.listOrdered,
    ToolBarStyle.listBullet,
    ToolBarStyle.size,
    ToolBarStyle.separator,
    ToolBarStyle.underline,
    ToolBarStyle.strike,
    ToolBarStyle.addTable,
    ToolBarStyle.background,
    ToolBarStyle.image,
    ToolBarStyle.separator,
    ToolBarStyle.video,
    ToolBarStyle.clean,
  ];

  final toolbarColor = Colors.grey;
  final backgroundColor = ThemeData.dark() == true
      ? const Color.fromARGB(255, 29, 36, 40)
      : Colors.white.withOpacity(0.1);
  final toolbarIconColor = Colors.black87;
  final editorTextStyle = const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
  final hintTextStyle = const TextStyle(
      fontSize: 18, color: Colors.black38, fontWeight: FontWeight.normal);

  bool hasFocus = false;
}

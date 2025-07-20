import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/models/text_model.dart';
import 'package:notes_app/cubits/text_editor_cubit/text_editor_cubit.dart';
import 'package:quill_html_editor_v2/quill_html_editor_v2.dart';

class TextEditor extends StatelessWidget {
  const TextEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TextEditorCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Editor'),
        actions: [
          IconButton(
            tooltip: 'Choose Color',
            onPressed: () {},
            icon: const Icon(Icons.color_lens_rounded),
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              final htmlText = await cubit.quillController.getText();
              final textModel = TextModel(
                title: cubit.titleController.text,
                content: htmlText,
                date: DateTime.now().toString(),
                color: cubit.color.value,
              );
              cubit.addText(textModel);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ToolBar(
              spacing: 1,
              toolBarColor: cubit.toolbarColor,
              padding: const EdgeInsets.all(8),
              iconSize: 25,
              iconColor: cubit.toolbarIconColor,
              activeIconColor: Colors.amber,
              controller: cubit.quillController,
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.horizontal,
              toolBarConfig: cubit.customToolBarList,
            ),
            Expanded(
              child: QuillHtmlEditor(
                minHeight: 500,
                isEnabled: true,
                ensureVisible: false,
                autoFocus: false,
                controller: cubit.quillController,
                hintText: 'Start typing...',
                textStyle: cubit.editorTextStyle,
                hintTextStyle: cubit.hintTextStyle,
                backgroundColor: Colors.transparent,
                hintTextAlign: TextAlign.start,
                hintTextPadding: const EdgeInsets.all(8.0),
                onFocusChanged: (hasFocus) =>
                    debugPrint('Editor focus: $hasFocus'),
                inputAction: InputAction.newline,
                loadingBuilder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.grey,
                    ),
                  );
                },
                onEditorCreated: () async {
                  print('we will insert here');
                  await cubit.setHtmlText();
                },
                onTextChanged: (p0) {
                  print('Changed Text :=> $p0');
                },
                onEditorResized: (height) =>
                    debugPrint('Editor resized $height'),
                onSelectionChanged: (sel) =>
                    debugPrint('index ${sel.index}, range ${sel.length}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

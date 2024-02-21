import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'enter title',
                    labelText: 'Title',
                    icon: Icons.title,
                    onSave: (value) {
                      title = value;
                    },
                  ),
                  const SizedBox(height: 25),
                  CustomTextField(
                    onSave: (value) {
                      subTitle = value;
                    },
                    hintText: 'enter content',
                    labelText: 'Content',
                    icon: Icons.content_paste,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print(title);
                        print(subTitle);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

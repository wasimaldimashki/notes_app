import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SizedBox(
        child: Column(
          children: [
            CustomTextField(
              hintText: 'edit title',
              labelText: 'Title',
              icon: Icons.title,
            ),
            SizedBox(height: 25),
            CustomTextField(
              hintText: 'edit content',
              labelText: 'Content',
              icon: Icons.content_paste,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}

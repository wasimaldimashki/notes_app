import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'enter title',
                labelText: 'Title',
                icon: Icons.title,
              ),
              SizedBox(height: 25),
              CustomTextField(
                hintText: 'enter content',
                labelText: 'Content',
                icon: Icons.content_paste,
                maxLines: 5,
              ),
              SizedBox(height: 25),
              CustomButton(),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

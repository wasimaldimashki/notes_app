import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

final GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? title, subTitle;

class _AddNoteFormState extends State<AddNoteForm> {
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
                  BlocBuilder<AddNoteCubit, AddNoteState>(
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state is AddNoteLoading ? true : false,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var currentDate = DateTime.now();
                            var formattedCurrentDate =
                                DateFormat.yMd().format(currentDate);
                            var noteModel = NoteModel(
                              title: title!,
                              subTitle: subTitle!,
                              date: formattedCurrentDate,
                              color: Colors.blue.value,
                            );
                            BlocProvider.of<AddNoteCubit>(context)
                                .addNote(noteModel);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      );
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

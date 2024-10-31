import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
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
    final addNoteCubit = BlocProvider.of<AddNoteCubit>(context);
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: Container(
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
                      hintText: 'Enter title',
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
                      hintText: 'Enter content',
                      labelText: 'Content',
                      icon: Icons.content_paste,
                      maxLines: 5,
                    ),
                    const SizedBox(height: 25),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...popularColors.map((color) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  addNoteCubit.setColor(color);
                                });
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                  border: addNoteCubit.color == color
                                      ? Border.all(
                                          color: Colors.black, width: 2)
                                      : null,
                                ),
                              ),
                            );
                          }),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  Color tempColor = addNoteCubit.color;
                                  return AlertDialog(
                                    title: const Text('Pick a color'),
                                    content: SingleChildScrollView(
                                      child: ColorPicker(
                                        pickerColor: tempColor,
                                        onColorChanged: (Color color) {
                                          tempColor = color;
                                        },
                                        showLabel: true,
                                        pickerAreaHeightPercent: 0.8,
                                        enableAlpha: true,
                                      ),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text('Select'),
                                        onPressed: () {
                                          setState(() {
                                            addNoteCubit.setColor(tempColor);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: const Icon(Icons.add, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                                color: addNoteCubit.color.value,
                              );
                              addNoteCubit.addNote(noteModel);
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
      ),
    );
  }
}

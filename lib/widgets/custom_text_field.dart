import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.icon,
    this.maxLines = 1,
    this.onSave,
    this.onChange,
    this.initialValue = '',
  });

  final String hintText;
  final String labelText;
  final IconData? icon;
  final int maxLines;
  final void Function(String?)? onSave;
  final void Function(String)? onChange;
  final String initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSave,
      onChanged: onChange,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      initialValue: initialValue,
      maxLines: maxLines,
      autofocus: true,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 20),
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

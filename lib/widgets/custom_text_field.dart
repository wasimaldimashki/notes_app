import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Title',
        labelStyle: const TextStyle(fontSize: 20),
        prefixIcon: const Icon(Icons.title),
        hintText: 'enter title',
        // errorText: 'This field is required',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

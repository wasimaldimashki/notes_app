import 'package:flutter/material.dart';
import 'package:notes_app/screens/notes_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: NotesView(),
    );
  }
}

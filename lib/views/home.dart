import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';

import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const NotesListView(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add New Note',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            showDragHandle: true,
            enableDrag: true,
            builder: (context) {
              return const AddNoteBottomSheet();
              // return DraggableScrollableSheet(
              //   expand: false,
              //   builder: (context, controller) {
              //     return SingleChildScrollView(
              //       controller: controller,
              //       child: const AddNoteBottomSheet(),
              //     );
              //   },
              // );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

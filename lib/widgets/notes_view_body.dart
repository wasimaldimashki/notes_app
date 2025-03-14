import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(mediaQuery.width / 40),
        child: Column(
          children: [
            ListView(
              children: [
                NotesListView(mediaQuery: mediaQuery),
              ],
            )
          ],
        ),
      ),
    );
  }
}

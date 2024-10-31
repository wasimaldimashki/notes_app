import 'package:animated_expandable_fab/animated_expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/view_cubit/view_cubit.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_grid_view.dart';
import 'package:notes_app/widgets/notes_list_view.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<ViewCubit, ViewMode>(
        builder: (context, viewMode) {
          return viewMode == ViewMode.list
              ? NotesListView(mediaQuery: mediaQuery)
              : NotesGridView(mediaQuery: mediaQuery);
        },
      ),
      floatingActionButton: BlocBuilder<ViewCubit, ViewMode>(
        builder: (context, viewMode) {
          return ExpandableFab(
            openIcon: const Icon(Icons.add),
            closeIcon: const Icon(Icons.close_rounded),
            distance: 100,
            children: [
              ActionButton(
                icon: Icon(
                  viewMode == ViewMode.list
                      ? Icons.grid_view_rounded
                      : Icons.view_list_rounded,
                ),
                onPressed: () {
                  context.read<ViewCubit>().toggleView();
                },
              ),
              ActionButton(
                icon: const Icon(Icons.text_fields_rounded),
                onPressed: () {},
              ),
              ActionButton(
                icon: const Icon(Icons.notes_rounded),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    showDragHandle: true,
                    enableDrag: true,
                    builder: (context) {
                      return const AddNoteBottomSheet();
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

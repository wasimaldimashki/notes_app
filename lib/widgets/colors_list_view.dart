import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isDarkTheme});
  final Color color;
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: _getBorderColor(context),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          if (color == Colors.transparent)
            const Icon(
              Icons.done,
              color: Colors.white,
              size: 30,
            ),
        ],
      ),
    );
  }

  Color _getBorderColor(BuildContext context) {
    final selectedColor = BlocProvider.of<AddNoteCubit>(context).color;

    return color == selectedColor ? Colors.white : Colors.grey;
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key, required this.onColorSelected});
  final Function(Color) onColorSelected;

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  List<Color> colors = [];
  int currentIndex = 0;
  bool isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _updateColors();
  }

  void _updateColors() {
    isDarkTheme = context.read<ThemeCubit>().state == ThemeModeEnum.Dark;
    setState(() {
      colors = _getColorsForTheme();
    });
  }

  List<Color> _getColorsForTheme() {
    if (isDarkTheme) {
      return [
        Colors.red,
        Colors.indigo,
        Colors.blue,
        Colors.yellow,
        Colors.green,
        Colors.brown,
        Colors.orange,
        Colors.grey,
        Colors.teal,
        Colors.transparent
      ];
    } else {
      return [
        Colors.indigo,
        Colors.indigoAccent,
        Colors.blue,
        Colors.blueAccent,
        Colors.blueGrey,
        Colors.lightBlue,
        Colors.yellowAccent,
        Colors.green,
        Colors.lightGreen,
        Colors.lightGreenAccent,
        Colors.brown,
        Colors.orange,
        Colors.deepOrangeAccent,
        Colors.grey,
        Colors.teal,
        Colors.amber,
        Colors.purple,
        Colors.purpleAccent,
        Colors.deepPurple,
        Colors.deepPurpleAccent,
        Colors.transparent
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: InkWell(
              onTap: () {
                currentIndex = index;
                widget.onColorSelected(colors[index]);
                BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                setState(() {});
              },
              borderRadius: BorderRadius.circular(25),
              child: ColorItem(
                color: colors[index],
                isDarkTheme: isDarkTheme,
              ),
            ),
          );
        },
      ),
    );
  }
}

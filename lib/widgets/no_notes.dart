import 'package:flutter/material.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({super.key, this.icon, required this.text});
  final IconData? icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(text), Icon(icon)],
      ),
    );
  }
}

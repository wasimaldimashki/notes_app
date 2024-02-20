import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                applyTextScaling: true,
                size: 25,
              ),
            ),
          )
        ],
        leading: InkWell(
          onTap: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          child: BlocBuilder<ThemeCubit, ThemeModeEnum>(
            builder: (context, themeMode) {
              return Icon(
                themeMode == ThemeModeEnum.Dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/cubits/theme/theme_cubit.dart';
import 'package:notes_app/cubits/view_cubit/view_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeEnum>(
      builder: (context, themeMode) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            centerTitle: true,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: themeMode == ThemeModeEnum.Dark
                      ? Colors.white.withOpacity(.05)
                      : Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BlocBuilder<ViewCubit, ViewMode>(
                  builder: (context, viewMode) {
                    return IconButton(
                      tooltip: 'Settings',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Settings Btn Pressed')));
                      },
                      icon: const Icon(
                        Icons.settings,
                        size: 25,
                      ),
                    );
                  },
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                context.read<ThemeCubit>().toggleTheme();
              },
              icon: Icon(
                themeMode == ThemeModeEnum.Dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: themeMode == ThemeModeEnum.Dark
                    ? Colors.yellow
                    : Colors.deepPurpleAccent,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

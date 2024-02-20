import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/core/class/theme_mod.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeModeEnum> {
  ThemeCubit() : super(ThemeModeEnum.Light);

  void toggleTheme() {
    emit(state == ThemeModeEnum.Light
        ? ThemeModeEnum.Dark
        : ThemeModeEnum.Light);
  }

  void updateThemeMode(Brightness platformBrightness) {
    emit(platformBrightness == Brightness.light
        ? ThemeModeEnum.Light
        : ThemeModeEnum.Dark);
  }
}

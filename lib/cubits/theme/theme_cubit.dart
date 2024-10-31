import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/core/class/theme_mod.dart';
import 'package:notes_app/core/shared/cash_manager.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeModeEnum> {
  ThemeCubit() : super(ThemeModeEnum.Light) {
    _loadThemeFromCache();
  }

  Future<void> _loadThemeFromCache() async {
    final themeMode = CashNetwork.getCashData(key: 'themeMode');
    print('Theme mode is :=> $themeMode');
    if (themeMode == 'ThemeModeEnum.Dark') {
      emit(ThemeModeEnum.Dark);
    } else {
      emit(ThemeModeEnum.Light);
    }
  }

  void toggleTheme() async {
    final newTheme =
        state == ThemeModeEnum.Light ? ThemeModeEnum.Dark : ThemeModeEnum.Light;
    emit(newTheme);
    await CashNetwork.insertToCash(
        key: 'themeMode', value: newTheme.toString());
    final themeMode = CashNetwork.getCashData(key: 'themeMode');
    print('Theme mode in Toggle is :=> $themeMode');
  }
}

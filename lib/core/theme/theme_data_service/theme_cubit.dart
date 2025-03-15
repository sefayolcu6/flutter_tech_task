import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/theme/theme_data_service/theme_data_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final ThemeDataService _themeService;

  ThemeCubit(this._themeService) : super(_themeService.themeMode);

  void toggleTheme() {
    _themeService.toggleTheme();
    emit(_themeService.themeMode);
  }
}

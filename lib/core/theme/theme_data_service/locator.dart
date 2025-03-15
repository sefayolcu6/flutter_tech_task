import 'package:flutter_tech_task/core/theme/theme_data_service/theme_data_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ThemeDataService>(ThemeDataService());
}

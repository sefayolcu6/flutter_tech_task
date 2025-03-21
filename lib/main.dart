import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/notification_service/notification_service.dart';
import 'package:flutter_tech_task/core/theme/theme_data_service/locator.dart';
import 'package:flutter_tech_task/core/theme/theme_data_service/theme_cubit.dart';
import 'package:flutter_tech_task/core/theme/theme_data_service/theme_data_service.dart';
import 'package:flutter_tech_task/features/main_page/view/main_page_screen.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/favorite_list/model/book_detail_model.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  await NotificationService().initNotification();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('tr')],
    path: 'assets/language',
    fallbackLocale: const Locale('en'),
    child: FlutterTechTask(
      navigatorKey: navigatorKey,
    ),
  ));
}

class FlutterTechTask extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const FlutterTechTask({super.key, required this.navigatorKey});

  @override
  State<FlutterTechTask> createState() => FlutterTechTaskState();
}

class FlutterTechTaskState extends State<FlutterTechTask> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ThemeCubit(getIt<ThemeDataService>()),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return MaterialApp(
                navigatorKey: widget.navigatorKey,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                darkTheme: ThemeData.dark().copyWith(
                  appBarTheme: AppBarTheme(
                    backgroundColor: CustomColorConstant.instance.blueGrey,
                    centerTitle: true,
                    toolbarHeight: 50.0,
                    titleTextStyle: TextStyle(color: CustomColorConstant.instance.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                    ),
                    actionsIconTheme: IconThemeData(color: CustomColorConstant.instance.white, size: 35.0),
                  ),
                ),
                themeMode: state,
                theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor: CustomColorConstant.instance.blueGrey,
                    centerTitle: true,
                    toolbarHeight: 50.0,
                    titleTextStyle: TextStyle(color: CustomColorConstant.instance.white, fontSize: 25.0, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                    ),
                    actionsIconTheme: IconThemeData(color: CustomColorConstant.instance.white, size: 35.0),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: BlocProvider(
                  create: (context) => MainPageCubit(),
                  child: MainPageScreen(
                    changeThemeMode: () => context.read<ThemeCubit>().toggleTheme(),
                  ),
                ));
          },
        ));
  }
}

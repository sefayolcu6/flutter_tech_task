import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/features/main_page/view/main_page_screen.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_cubit.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('tr')],
    path: 'assets/language',
    fallbackLocale: const Locale('en'),
    child: const FlutterTechTask(),
  ));
}

class FlutterTechTask extends StatefulWidget {
  const FlutterTechTask({super.key});

  @override
  State<FlutterTechTask> createState() => FlutterTechTaskState();
}

class FlutterTechTaskState extends State<FlutterTechTask> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
          child: MainPageScreen(),
        ));
  }
}

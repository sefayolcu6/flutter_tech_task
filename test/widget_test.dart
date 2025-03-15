import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/features/main_page/view/main_page_screen.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  testWidgets('Testing for MainPageScreen', (WidgetTester tester) async {
    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: [Locale('en'), Locale('tr')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: BlocProvider(
          create: (context) => MainPageCubit(),
          child: MainPageScreen(
            changeThemeMode: () => ThemeData.dark(),
          ),
        ),
      ),
    );

    if (find.byType(ListView).evaluate().isNotEmpty) {
      //MainPageScreen ekranında ListView olup olmadığını kontrol ediyor. (byType Widget türünü belirliyor,evaluate widget varlığını kontrol ediyor. )
      await tester.fling(find.byType(ListView), const Offset(0, 500), 1000); // Aşağı doğru kaydır
      await tester.pumpAndSettle(); //Animasyonlar bitinceye kadr bekle
    }
  });
}

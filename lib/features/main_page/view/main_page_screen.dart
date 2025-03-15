import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/helpers/image_paths.dart';
import 'package:flutter_tech_task/core/widgets/listtile_card_widget.dart';
import 'package:flutter_tech_task/core/widgets/not_found_widget.dart';
import 'package:flutter_tech_task/core/widgets/switch_widget.dart';
import 'package:flutter_tech_task/core/widgets/text_rich.dart';
import 'package:flutter_tech_task/core/widgets/textformfield_widget.dart';
import 'package:flutter_tech_task/features/book_details/view/book_detail_screen.dart';
import 'package:flutter_tech_task/features/book_details/viewmodel/book_detail_cubit.dart';
import 'package:flutter_tech_task/features/favorite_list/view/favorite_list_screen.dart';
import 'package:flutter_tech_task/features/favorite_list/view_model/favorite_list_cubit.dart';
import 'package:flutter_tech_task/features/main_page/model/book_detail_model.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_cubit.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_state.dart';
import 'package:lottie/lottie.dart';

class MainPageScreen extends StatefulWidget {
  final Function() changeThemeMode;
  const MainPageScreen({super.key, required this.changeThemeMode});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  late MainPageCubit mainPageCubit;
  TextEditingController searchBarTextEditingController = TextEditingController();
  final ValueNotifier<bool> changeLanguage = ValueNotifier<bool>(true);
  final ValueNotifier<bool> changeTheme = ValueNotifier<bool>(true);
  @override
  void initState() {
    mainPageCubit = context.read<MainPageCubit>();
    mainPageCubit.getBookList();
    super.initState();
  }

  void setLanguage() {
    changeLanguage.value = !changeLanguage.value;

    changeLanguage.value ? context.setLocale(const Locale('en')) : context.setLocale(const Locale('tr'));
  }

  void setSwitch() {
    changeTheme.value = !changeTheme.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppar(context),
      body: _buildMainBody(),
    );
  }

  Widget _buildMainBody() {
    return BlocBuilder<MainPageCubit, MainPageCubitState>(
      builder: (context, state) {
        if (state is MainPageCubitLoading) {
          return Center(
              child: Lottie.asset(
            ImagePaths.instance.loadingLottie,
          ));
        } else if (state is MainPageCubitSuccess) {
          return Column(
            children: [
              AppTextFormField(
                suffixIconOnPressed: () {
                  mainPageCubit.searchBook(query: "");
                },
                controller: searchBarTextEditingController,
                label: "search_book".tr(),
                onChanged: (p0) {
                  mainPageCubit.searchBook(query: p0);
                },
              ),
              _buildBookCardList(bookList: state.bookModel!),
            ],
          );
        } else if (state is MainPageCubitError) {
          return NotFoundWidget(
            title: state.title,
            desc: state.description,
          );
        } else {
          return NotFoundWidget(
            title: "not_found".tr(),
            desc: "book_list_not_found".tr(),
          );
        }
      },
    );
  }

  Widget _buildBookCardList({required GetBookList bookList}) {
    return Expanded(
      child: ListView.builder(
        itemCount: bookList.data?.length,
        itemBuilder: (context, index) {
          return CustomListTileCard(
            title: Text(bookList.data?[index].title! ?? ""),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextRich(
                  firstText: 'year'.tr(),
                  lastText: bookList.data![index].year.toString(),
                ),
                CustomTextRich(
                  firstText: 'isbn'.tr(),
                  lastText: bookList.data![index].isbn ?? "",
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => BookDetailCubit(),
                            child: BookDetailScreen(
                              bookId: bookList.data![index].id!,
                            ),
                          )));
            },
            trailing: Icon(Icons.chevron_right_outlined),
            leading: Icon(Icons.menu_book_sharp),
          );
        },
      ),
    );
  }

  AppBar _buildAppar(BuildContext context) {
    return AppBar(
      title: Text("mainPage".tr()),
      leading: ValueListenableBuilder(
        valueListenable: changeLanguage,
        builder: (context, value, child) {
          return IconButton(
              onPressed: () {
                setLanguage();
              },
              icon: Icon(
                Icons.language_rounded,
                color: CustomColorConstant.instance.white,
              ));
        },
      ),
      actions: [
        ValueListenableBuilder(
          valueListenable: changeTheme,
          builder: (context, value, child) {
            return AppSwitch(
              isActive: changeTheme.value,
              onChanged: (p0) {
                widget.changeThemeMode();
                setSwitch();
                return true;
              },
            );
          },
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => FavoriteListCubit(),
                      child: FavoriteListScreen(),
                    ),
                  ));
            },
            icon: Icon(Icons.star_outline))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/widgets/listtile_card_widget.dart';
import 'package:flutter_tech_task/core/widgets/not_found_widget.dart';
import 'package:flutter_tech_task/core/widgets/textformfield_widget.dart';
import 'package:flutter_tech_task/features/book_details/view/book_detail_screen.dart';
import 'package:flutter_tech_task/features/favorite_list/view/favorite_list_screen.dart';
import 'package:flutter_tech_task/features/main_page/model/book_detail_model.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_cubit.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_state.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  late MainPageCubit mainPageCubit;
  TextEditingController searchBarTextEditingController = TextEditingController();
  @override
  void initState() {
    mainPageCubit = context.read<MainPageCubit>();
    mainPageCubit.getBookList();
    super.initState();
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
          return Center(child: CircularProgressIndicator());
        } else if (state is MainPageCubitSuccess) {
          return Column(
            children: [
              AppTextFormField(
                controller: searchBarTextEditingController,
                label: "Kitap Ara",
              ),
              _buildBookCardList(bookList: state.bookList!),
            ],
          );
        } else if (state is MainPageCubitError) {
          return NotFoundWidget(
            title: state.title,
            desc: state.description,
          );
        } else {
          return NotFoundWidget(
            title: "Bulunamadı",
            desc: "Kitap listesi bulunamadı",
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
            title: Text(bookList.data![index].title!),
            subtitle: Text(bookList.data![index].year.toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailScreen(),
                  ));
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
      title: Text("Ana Sayfa"),
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.language_rounded,
            color: CustomColorConstant.instance.white,
          )),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteListScreen(),
                  ));
            },
            icon: Icon(Icons.star_outline))
      ],
    );
  }
}

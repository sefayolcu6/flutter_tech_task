import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/widgets/listtile_card_widget.dart';
import 'package:flutter_tech_task/core/widgets/textformfield_widget.dart';
import 'package:flutter_tech_task/features/book_details/view/book_detail_screen.dart';
import 'package:flutter_tech_task/features/favorite_list/view/favorite_list_screen.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  TextEditingController searchBarTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppar(context),
      body: _buildMainBody(),
    );
  }

  Column _buildMainBody() {
    return Column(
      children: [
        AppTextFormField(
          controller: searchBarTextEditingController,
          label: "Kitap Ara",
        ),
        _buildBookCardList(),
      ],
    );
  }

  Widget _buildBookCardList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return CustomListTileCard(
            title: Text("Kitap Adı"),
            subtitle: Text("Yazar"),
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

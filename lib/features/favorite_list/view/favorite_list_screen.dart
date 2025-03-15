import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/helpers/custom_paddings.dart';
import 'package:flutter_tech_task/core/helpers/image_paths.dart';
import 'package:flutter_tech_task/core/widgets/dialog_widget.dart';
import 'package:flutter_tech_task/core/widgets/divider_widget.dart';
import 'package:flutter_tech_task/core/widgets/not_found_widget.dart';
import 'package:flutter_tech_task/features/favorite_list/view_model/favorite_list_cubit.dart';
import 'package:flutter_tech_task/features/favorite_list/view_model/favorite_list_state.dart';
import 'package:lottie/lottie.dart';

class FavoriteListScreen extends StatefulWidget {
  const FavoriteListScreen({super.key});

  @override
  State<FavoriteListScreen> createState() => _FavoriteListScreenState();
}

class _FavoriteListScreenState extends State<FavoriteListScreen> {
  late FavoriteListCubit favoriteListCubit;
  @override
  void initState() {
    favoriteListCubit = context.read<FavoriteListCubit>();
    favoriteListCubit.getBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "my_favorite_list".tr(),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  DialogManager.customAlertDialog(
                      context: context,
                      title: "are_you_sure".tr(),
                      alertBody: [Text("your_saved_data_will_be_deleted".tr())],
                      buttonOntap: () {
                        favoriteListCubit.clearBooks();
                        Navigator.pop(context);
                      },
                      buttonText: "yes".tr());
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: BlocBuilder<FavoriteListCubit, FavoriteListState>(
          builder: (context, state) {
            if (state is FavoriteListLoading) {
              return Center(child: Lottie.asset(ImagePaths.instance.loadingLottie));
            } else if (state is FavoriteListSuccess) {
              return ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: CustomPaddingConstant.instance.appPaddingAll16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.books[index].handle,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: CustomColorConstant.instance.primaryColor,
                                ),
                          ),
                          customDivider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildDetailRow("handle".tr(), state.books[index].handle),
                              _buildDetailRow("isbn".tr(), state.books[index].isbn),
                              _buildDetailRow("publisher".tr(), state.books[index].publisher),
                              _buildDetailRow("year".tr(), state.books[index].year.toString()),
                              _buildDetailRow("notes".tr(), state.books[index].notes),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is FavoriteListError) {
              return NotFoundWidget(title: state.description, desc: state.description);
            } else {
              return NotFoundWidget(title: "not_found".tr(), desc: "book_list_not_found".tr());
            }
          },
        ));
  }

  Widget _buildDetailRow(
    String label,
    String value,
  ) {
    return Padding(
      padding: CustomPaddingConstant.instance.appPaddingAll8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
            ),
          ),
        ],
      ),
    );
  }
}

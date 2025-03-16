import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/helpers/custom_paddings.dart';
import 'package:flutter_tech_task/core/helpers/image_paths.dart';
import 'package:flutter_tech_task/core/mixins/utils.dart';
import 'package:flutter_tech_task/core/widgets/divider_widget.dart';
import 'package:flutter_tech_task/core/widgets/flushbar_widget.dart';
import 'package:flutter_tech_task/core/widgets/not_found_widget.dart';
import 'package:flutter_tech_task/features/book_details/viewmodel/book_detail_cubit.dart';
import 'package:flutter_tech_task/features/book_details/viewmodel/book_detail_state.dart';
import 'package:flutter_tech_task/features/favorite_list/model/book_detail_model.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

class BookDetailScreen extends StatefulWidget {
  final int bookId;
  const BookDetailScreen({super.key, required this.bookId});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> with Utils {
  late BookDetailCubit bookDetailCubit;
  @override
  void initState() {
    bookDetailCubit = context.read<BookDetailCubit>();
    bookDetailCubit.getBookDetailList(bookId: widget.bookId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBodyView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("detailInfo".tr()),
    );
  }

  BlocBuilder<BookDetailCubit, BookDetailState> _buildBodyView() {
    return BlocBuilder<BookDetailCubit, BookDetailState>(
      builder: (context, state) {
        if (state is BookDetailLoading) {
          return Center(child: Lottie.asset(ImagePaths.instance.loadingLottie));
        } else if (state is BookDetailSuccess) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          state.getBookDetailList.data!.title!,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: CustomColorConstant.instance.primaryColor,
                                overflow: TextOverflow.ellipsis,
                              ),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            var box = await Hive.openBox<Book>('books');

                            List<Book> bookList = [
                              Book(
                                  title: state.getBookDetailList.data?.title ?? "-",
                                  handle: state.getBookDetailList.data?.handle ?? "-",
                                  isbn: state.getBookDetailList.data?.isbn ?? "-",
                                  publisher: state.getBookDetailList.data?.publisher ?? "-",
                                  year: state.getBookDetailList.data?.year?.toInt() ?? 0,
                                  notes: state.getBookDetailList.data?.notes.toString() ?? "-"),
                            ];

                            for (var book in bookList) {
                              await box.add(book);
                            }

                            customSuccessFlushbar(context: context, title: "success".tr(), description: "added_book_informations".tr());
                          },
                          icon: Icon(Icons.bookmark_add_outlined))
                    ],
                  ),
                  customDivider(),
                  _buildDetailRow("handle".tr(), state.getBookDetailList.data!.handle!),
                  _buildDetailRow("isbn".tr(), state.getBookDetailList.data!.isbn!),
                  _buildDetailRow("publisher".tr(), state.getBookDetailList.data!.publisher!),
                  _buildDetailRow("year".tr(), state.getBookDetailList.data!.year.toString()),
                  _buildDetailRow("notes".tr(), state.getBookDetailList.data!.notes?.join("\n") ?? "-"),
                ],
              ),
            ),
          );
        } else if (state is BookDetailError) {
          return NotFoundWidget(title: "not_found".tr(), desc: "not_found_book_info".tr());
        } else {
          return NotFoundWidget(title: "not_found".tr(), desc: "not_found_book_info".tr());
        }
      },
    );
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

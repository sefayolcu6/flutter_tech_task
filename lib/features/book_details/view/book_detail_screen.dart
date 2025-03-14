import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/core/helpers/custom_colors.dart';
import 'package:flutter_tech_task/core/helpers/custom_paddings.dart';
import 'package:flutter_tech_task/core/widgets/divider_widget.dart';
import 'package:flutter_tech_task/core/widgets/flushbar_widget.dart';
import 'package:flutter_tech_task/core/widgets/not_found_widget.dart';
import 'package:flutter_tech_task/features/book_details/viewmodel/book_detail_cubit.dart';
import 'package:flutter_tech_task/features/book_details/viewmodel/book_detail_state.dart';

class BookDetailScreen extends StatefulWidget {
  final int bookId;
  const BookDetailScreen({super.key, required this.bookId});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
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
      appBar: AppBar(
        title: Text("Detay Bilgileri"),
        actions: [
          IconButton(
              onPressed: () {
                customSuccessFlushbar(context: context, title: "Başarılı", description: "İlgili kitap bilgileri favorilere eklendi!");
              },
              icon: Icon(Icons.bookmark_add_outlined))
        ],
      ),
      body: BlocBuilder<BookDetailCubit, BookDetailState>(
        builder: (context, state) {
          if (state is BookDetailLoading) {
            return Center(child: CircularProgressIndicator());
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
                    Text(
                      state.getBookDetailList.data!.title!,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: CustomColorConstant.instance.primaryColor,
                          ),
                    ),
                    customDivider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow("Handle", state.getBookDetailList.data!.handle!),
                        _buildDetailRow("ISBN", state.getBookDetailList.data!.isbn!),
                        _buildDetailRow("Yayıncı", state.getBookDetailList.data!.publisher!),
                        _buildDetailRow("Yıl", state.getBookDetailList.data!.year.toString()),
                        _buildDetailRow("Notlar", state.getBookDetailList.data!.notes?.join("\n") ?? "-"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (state is BookDetailError) {
            return NotFoundWidget(title: "Bulunamadı", desc: "Kitaba ait detay bilgisi bulunamadı");
          } else {
            return NotFoundWidget(title: "Bulunamadı", desc: "Kitaba ait detay bilgisi bulunamadı");
          }
        },
      ),
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
            child: Text(value, style: TextStyle(color: CustomColorConstant.instance.black)),
          ),
        ],
      ),
    );
  }
}

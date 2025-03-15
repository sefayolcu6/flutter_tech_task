import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/features/favorite_list/model/book_detail_model.dart';
import 'package:flutter_tech_task/features/favorite_list/view_model/favorite_list_state.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteListCubit extends Cubit<FavoriteListState> {
  FavoriteListCubit() : super(FavoriteListInitial());

  List<Book> books = [];
  Future<void> getBooks() async {
    emit(FavoriteListLoading());
    var box = await Hive.openBox<Book>('books');
    if (box.isNotEmpty) {
      books = box.values.toList();
      emit(FavoriteListSuccess(books: books));

      for (var book in books) {
        print("Handle: ${book.handle}, ISBN: ${book.isbn}, Publisher: ${book.publisher}, Year: ${book.year}, Notes: ${book.notes},title:${book.title}");
      }
    } else {
      emit(FavoriteListError(title: "not_found".tr(), description: "book_list_not_found".tr()));
    }
  }

  Future<void> clearBooks() async {
    var box = await Hive.openBox<Book>('books');
    await box.clear();
  }
}

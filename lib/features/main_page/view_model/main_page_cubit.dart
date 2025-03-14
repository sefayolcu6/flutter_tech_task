import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/features/main_page/model/book_detail_model.dart';
import 'package:flutter_tech_task/features/main_page/services/main_page_services.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_state.dart';

class MainPageCubit extends Cubit<MainPageCubitState> {
  MainPageCubit() : super(MainPageCubitInitial());

  MainPageServices mainPageServices = MainPageServices();
  GetBookList booksTempList = GetBookList();

  Future<void> getBookList() async {
    emit(MainPageCubitLoading());

    mainPageServices.getBookList(apiUrl: "https://stephen-king-api.onrender.com/api/books", fromJson: (p0) => GetBookList.fromJson(p0)).then(
      (value) {
        if (value != null) {
          booksTempList = value;
          emit(MainPageCubitSuccess(bookList: value));
        } else {
          emit(MainPageCubitError(title: "Bulunamadı", description: "Kitap listesi bulunamadı"));
        }
      },
    );
  }

  void searchBook({required String query}) {
    if (query.isEmpty) {
      emit(MainPageCubitSuccess(bookList: booksTempList));
    } else {
      final searchResults = booksTempList.data?.where((book) => book.title?.toLowerCase().contains(query.toLowerCase()) ?? false || (book.title?.toLowerCase().contains(query.toLowerCase()) ?? false)).toList() ?? [];

      emit(MainPageCubitSuccess(bookList: GetBookList(data: searchResults)));
    }
  }
}

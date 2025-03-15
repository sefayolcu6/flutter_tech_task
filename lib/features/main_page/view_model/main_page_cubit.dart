import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/features/main_page/model/book_detail_model.dart';
import 'package:flutter_tech_task/features/main_page/services/main_page_services.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_state.dart';

class MainPageCubit extends Cubit<MainPageCubitState> {
  MainPageCubit() : super(MainPageCubitInitial());

  MainPageServices mainPageServices = MainPageServices();
  GetBookList booksTempModel = GetBookList();

  Future<void> getBookList() async {
    emit(MainPageCubitLoading());

    mainPageServices.getModalFunc(apiUrl: "https://stephen-king-api.onrender.com/api/books", fromJson: (p0) => GetBookList.fromJson(p0)).then(
      (value) {
        if (value != null) {
          booksTempModel = value;
          emit(MainPageCubitSuccess(bookModel: value));
        } else {
          emit(MainPageCubitError(title: "not_found".tr(), description: "book_list_not_found".tr()));
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(MainPageCubitError(title: "not_found".tr(), description: "book_list_not_found".tr()));
      },
    );
  }

  void searchBook({required String query}) {
    if (query.isEmpty) {
      emit(MainPageCubitSuccess(bookModel: booksTempModel));
    } else {
      final searchResults = booksTempModel.data?.where((book) => book.title?.toLowerCase().contains(query.toLowerCase()) ?? false).toList() ?? [];

      emit(MainPageCubitSuccess(bookModel: GetBookList(data: searchResults)));
    }
  }
}

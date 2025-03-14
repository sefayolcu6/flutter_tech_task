import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/features/book_details/model/book_detail_model.dart';
import 'package:flutter_tech_task/features/book_details/services/book_details_services.dart';
import 'package:flutter_tech_task/features/book_details/viewmodel/book_detail_state.dart';

class BookDetailCubit extends Cubit<BookDetailState> {
  BookDetailCubit() : super(BookDetailInitial());
  BookDetailsServices bookDetailsServices = BookDetailsServices();
  Future<void> getBookDetailList({required int bookId}) async {
    emit(BookDetailLoading());
    bookDetailsServices.getModalFunc(apiUrl: "https://stephen-king-api.onrender.com/api/book/$bookId", fromJson: (p0) => GetBookDetailList.fromJson(p0)).then(
      (value) {
        if (value != null) {
          emit(BookDetailSuccess(getBookDetailList: value));
        } else {
          emit(BookDetailError(title: "not_found".tr(), description: "not_found_book_info".tr()));
        }
      },
    ).onError(
      (error, stackTrace) {
        emit(BookDetailError(title: "not_found".tr(), description: "not_found_book_info".tr()));
      },
    );
  }
}

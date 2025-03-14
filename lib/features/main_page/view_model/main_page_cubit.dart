import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/features/main_page/model/book_detail_model.dart';
import 'package:flutter_tech_task/features/main_page/services/main_page_services.dart';
import 'package:flutter_tech_task/features/main_page/view_model/main_page_state.dart';

class MainPageCubit extends Cubit<MainPageCubitState> {
  MainPageCubit() : super(MainPageCubitInitial());

  MainPageServices mainPageServices = MainPageServices();

  Future<void> getBookList() async {
    emit(MainPageCubitLoading());

    mainPageServices.getBookList(apiUrl: "https://stephen-king-api.onrender.com/api/books", fromJson: (p0) => GetBookList.fromJson(p0)).then(
      (value) {
        if (value != null) {
          emit(MainPageCubitSuccess(bookList: value));
        } else {
          emit(MainPageCubitError(title: "Bulunamadı", description: "Kitap listesi bulunamadı"));
        }
      },
    );
  }
}

import 'package:flutter_tech_task/features/main_page/model/book_detail_model.dart';

abstract class MainPageCubitState {}

final class MainPageCubitInitial extends MainPageCubitState {}

final class MainPageCubitLoading extends MainPageCubitState {}

final class MainPageCubitSuccess extends MainPageCubitState {
  final GetBookList? bookModel;

  MainPageCubitSuccess({required this.bookModel});
}

final class MainPageCubitError extends MainPageCubitState {
  final String title;
  final String description;

  MainPageCubitError({required this.title, required this.description});
}

import 'package:flutter_tech_task/features/book_details/model/book_detail_model.dart';

abstract class BookDetailState {}

final class BookDetailInitial extends BookDetailState {}

final class BookDetailLoading extends BookDetailState {}

final class BookDetailSuccess extends BookDetailState {
  final GetBookDetailList getBookDetailList;

  BookDetailSuccess({required this.getBookDetailList});
}

final class BookDetailError extends BookDetailState {
  final String title;
  final String description;

  BookDetailError({required this.title, required this.description});
}

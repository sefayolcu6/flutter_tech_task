import 'package:flutter_tech_task/features/favorite_list/model/book_detail_model.dart';

abstract class FavoriteListState {}

final class FavoriteListInitial extends FavoriteListState {}

final class FavoriteListLoading extends FavoriteListState {}

final class FavoriteListSuccess extends FavoriteListState {
  final List<Book> books;

  FavoriteListSuccess({required this.books});
}

final class FavoriteListError extends FavoriteListState {
  final String title;
  final String description;

  FavoriteListError({required this.title, required this.description});
}

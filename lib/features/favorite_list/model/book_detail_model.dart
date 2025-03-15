import 'package:hive/hive.dart';

part 'book_detail_model.g.dart';

@HiveType(typeId: 0)
class Book extends HiveObject {
  @HiveField(0)
  String handle;

  @HiveField(1)
  String isbn;

  @HiveField(2)
  String publisher;

  @HiveField(3)
  int year;

  @HiveField(4)
  String notes;
  @HiveField(5)
  String title;

  Book({
    required this.handle,
    required this.isbn,
    required this.publisher,
    required this.year,
    required this.notes,
    required this.title
  });
}

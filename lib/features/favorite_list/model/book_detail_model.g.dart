// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 0;

  @override
  Book read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Book(
      handle: fields[0] as String,
      isbn: fields[1] as String,
      publisher: fields[2] as String,
      year: fields[3] as int,
      notes: fields[4] as String,
      title: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Book obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.handle)
      ..writeByte(1)
      ..write(obj.isbn)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.notes)
      ..writeByte(5)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

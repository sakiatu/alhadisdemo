import 'dart:ui';

class Book {
  final int id;
  final String? name;
  final Color? color;
  final String? code;


  Book({
    required this.id,
    this.name,
    this.color,
    this.code,
  });
}

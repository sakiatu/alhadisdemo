import 'package:alhadisdemo/domain/entities/book.dart';
import 'package:alhadisdemo/domain/entities/section.dart';

class Chapter {
  final Book book;
  final String title;
  final List<Section> sections;

  Chapter({
    required this.book,
    required this.title,
    required this.sections,
  });
}

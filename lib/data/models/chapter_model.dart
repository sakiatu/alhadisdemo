

class ChapterModel {
  final int id;
  final int chapterId;
  final int bookId;
  final String bookName;
  final String title;
  final int number;
  final String hadisRange;

  ChapterModel({
    required this.id,
    required this.chapterId,
    required this.bookId,
    required this.bookName,
    required this.title,
    required this.number,
    required this.hadisRange,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        id: json['id'],
        chapterId: json['chapter_id'],
        bookId: json['book_id'],
        bookName: json['book_name'],
        title: json['title'],
        number: json['number'],
        hadisRange: json['hadis_range'],
      );
}

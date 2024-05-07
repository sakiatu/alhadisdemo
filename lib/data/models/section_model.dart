class SectionModel{
  final int id;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String title;
  final String preface;
  final String number;


  SectionModel({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.title,
    required this.preface,
    required this.number,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
    id: json['id'],
    bookId: json['book_id'],
    bookName: json['book_name'],
    chapterId: json['chapter_id'],
    sectionId: json['section_id'],
    title: json['title'],
    preface: json['preface'],
    number: json['number'],
  );

}



class BookModel {
  final int id;
  final String title;
  final String titleAr;
  final int numberOfHadis;
  final String abvrCode;
  final String bookName;
  final String bookDescr;



  BookModel({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.numberOfHadis,
    required this.abvrCode,
    required this.bookName,
    required this.bookDescr,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    id: json['id'],
    title: json['title'],
    titleAr: json['title_ar'],
    numberOfHadis: json['number_of_hadis'],
    abvrCode: json['abvr_code'],
    bookName: json['book_name'],
    bookDescr: json['book_descr'],
  );
}

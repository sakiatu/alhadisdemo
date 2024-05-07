class Hadith {
  final int id;
  final String bookName;
  final String grade;
  final int gradeColor;
  final String arabicText;
  final String arabicTextDiacless;
  final String banglaText;
  final String narrator;
  final String note;

  String get footerText => 'ফুটনোট:\n$note';

  String get narratorText => '$narrator থেকে বর্ণিত:';

  String get number {
    final serial = id.toString()
      .replaceAll(RegExp('0'), '০')
      .replaceAll(RegExp('1'), '১')
      .replaceAll(RegExp('2'), '২')
      .replaceAll(RegExp('3'), '৩')
      .replaceAll(RegExp('4'), '৪')
      .replaceAll(RegExp('5'), '৫')
      .replaceAll(RegExp('6'), '৬')
      .replaceAll(RegExp('7'), '৭')
      .replaceAll(RegExp('8'), '৮')
      .replaceAll(RegExp('9'), '৯');

    return 'হাদিস: $serial';
  }

  Hadith({
    required this.id,
    required this.bookName,
    required this.grade,
    required this.gradeColor,
    required this.arabicText,
    required this.arabicTextDiacless,
    required this.banglaText,
    required this.narrator,
    required this.note,
  });
}

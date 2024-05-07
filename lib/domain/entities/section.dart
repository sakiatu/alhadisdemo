import 'hadith.dart';

class Section {
  final String number;
  final String title;
  final String preface;
  final List<Hadith> hadithList;

  Section({
    required this.number,
    required this.title,
    required this.preface,
    required this.hadithList,
  });
}

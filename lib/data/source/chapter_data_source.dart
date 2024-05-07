import 'package:alhadisdemo/app/services/local_db.dart';
import 'package:alhadisdemo/data/models/chapter_model.dart';
import 'package:alhadisdemo/domain/params/fetch_chapter_params.dart';

import '../models/book_model.dart';
import '../models/hadith_model.dart';
import '../models/section_model.dart';

class ChapterDataSource {
  final LocalDb localDb;

  ChapterDataSource(this.localDb);

  Future<BookModel> fetchBook(FetchChapterParams params) async {
    final book = await localDb.getBook(params.bookId);
    return BookModel.fromJson(book);
  }

  Future<ChapterModel> fetchChapter(FetchChapterParams params) async {
    final chapter = await localDb.getChapter(params.chapterId);
    return ChapterModel.fromJson(chapter);
  }

  Future<List<SectionModel>> fetchSections(FetchChapterParams params) async {
    final sections = await localDb.getSectionOfChapter(params.chapterId);
    return List.from(sections).map((e) => SectionModel.fromJson(e)).toList();
  }

  Future<List<HadithModel>> fetchHadithList(FetchChapterParams params) async {
    final hadithList = await localDb.getHadithOfChapter(params.chapterId);
    return List.from(hadithList).map((e) => HadithModel.fromJson(e)).toList();
  }
}

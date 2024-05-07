import 'package:alhadisdemo/app/types/typedef.dart';
import 'package:alhadisdemo/domain/entities/book.dart';
import 'package:alhadisdemo/domain/entities/chapter.dart';
import 'package:alhadisdemo/domain/entities/section.dart';
import 'package:alhadisdemo/domain/params/fetch_chapter_params.dart';
import 'package:alhadisdemo/domain/repositories/chapter_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/hadith.dart';
import '../source/chapter_data_source.dart';

class ChapterRepoIml extends ChapterRepo {
  final ChapterDataSource chapterDataSource;

  ChapterRepoIml(this.chapterDataSource);

  @override
  FutureResult<Chapter> fetchChapter(FetchChapterParams params) async {
    try {
      final bookModel = await chapterDataSource.fetchBook(params);
      final chapterModel = await chapterDataSource.fetchChapter(params);
      final sectionModels = await chapterDataSource.fetchSections(params);
      final hadithModels = await chapterDataSource.fetchHadithList(params);

      final sections = sectionModels.map((s) {
        final hadithList = hadithModels
            .where((e) => e.sectionId == s.id)
            .map((h) => Hadith(
                id: h.hadithId,
                note: h.note,
                grade: h.grade,
                arabicText: h.ar,
                banglaText: h.bn,
                narrator: h.narrator,
                bookName: bookModel.title,
                arabicTextDiacless: h.arDiacless,
                gradeColor: int.parse('ff${h.gradeColor.replaceFirst('#', '')}', radix: 16)))
            .toList();

        return Section(
          number: s.number,
          preface: s.preface,
          hadithList: hadithList,
          title: s.title == s.number ? '' : s.title,
        );
      }).toList();

      final chapter = Chapter(
        book: Book(id: bookModel.id, name: bookModel.title, code: bookModel.bookName.characters.first.toUpperCase()),
        title: chapterModel.title,
        sections: sections,
      );

      return Right(chapter);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}

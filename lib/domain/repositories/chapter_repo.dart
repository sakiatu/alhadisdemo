import 'package:alhadisdemo/app/types/typedef.dart';
import 'package:alhadisdemo/domain/params/fetch_chapter_params.dart';

import '../entities/chapter.dart';

abstract class ChapterRepo {
  FutureResult<Chapter> fetchChapter(FetchChapterParams params);
}

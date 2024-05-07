import 'package:alhadisdemo/app/types/typedef.dart';
import 'package:alhadisdemo/app/usecase/usecase.dart';
import 'package:alhadisdemo/domain/entities/chapter.dart';
import 'package:alhadisdemo/domain/params/fetch_chapter_params.dart';
import 'package:alhadisdemo/domain/repositories/chapter_repo.dart';

class FetchChapterUsecase extends UseCase<Chapter,FetchChapterParams>{
  final ChapterRepo repository;

  FetchChapterUsecase(this.repository);

  @override
  FutureResult<Chapter> call(FetchChapterParams params) => repository.fetchChapter(params);


}
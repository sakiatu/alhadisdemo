import 'package:alhadisdemo/domain/usecases/fetch_chapter_usecase.dart';
import 'package:get/get.dart';

import '../../../domain/entities/chapter.dart';
import '../../../domain/params/fetch_chapter_params.dart';

class HadithDetailsController extends GetxController implements GetxService {
  final loading = false.obs;
  String? error;
  late Chapter chapter;

  final FetchChapterUsecase _fetchChapterUsecase;

  HadithDetailsController(this._fetchChapterUsecase);

  void loadChapter(int chapterId, int bookId) async {
    loading.value = true;
    error = null;
    final res = await _fetchChapterUsecase(FetchChapterParams(chapterId, bookId));
    res.fold((l) => error = l.toString(), (r) => chapter = r);
    loading.value = false;
  }
}

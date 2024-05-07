import 'package:alhadisdemo/data/repositories/chapter_repo.dart';
import 'package:alhadisdemo/domain/usecases/fetch_chapter_usecase.dart';
import 'package:get/get.dart';

import 'hadith_details_controller.dart';

class HadithDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchChapterUsecase(Get.find<ChapterRepoIml>()));
    Get.put(HadithDetailsController(Get.find()));
  }

}

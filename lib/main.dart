import 'package:alhadisdemo/app/services/local_db.dart';
import 'package:alhadisdemo/data/repositories/chapter_repo.dart';
import 'package:alhadisdemo/data/source/chapter_data_source.dart';
import 'package:alhadisdemo/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(const App());
}

initializeServices() async {
  final db = LocalDb();
  await db.init();
  Get.lazyPut(() => db);

  Get.lazyPut(() => ChapterRepoIml(ChapterDataSource(Get.find())));
}

import 'package:alhadisdemo/app/config/color.dart';
import 'package:alhadisdemo/app/config/theme.dart';
import 'package:alhadisdemo/domain/entities/book.dart';
import 'package:alhadisdemo/presentation/controllers/hadith_details/hadith_details_binding.dart';
import 'package:alhadisdemo/presentation/pages/hadith_details/hadith_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../app/config/string.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyString.appName,
      themeMode: ThemeMode.system,
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      initialBinding: HadithDetailsBinding(),
      home: HadithDetailsPage(chapterId: 1, book: Book(id: 1, color: MyColor.bukhari, code: 'B')),
    );
  }
}

import 'package:alhadisdemo/app/config/icon.dart';
import 'package:alhadisdemo/app/config/string.dart';
import 'package:alhadisdemo/domain/entities/book.dart';
import 'package:alhadisdemo/presentation/controllers/hadith_details/hadith_details_controller.dart';
import 'package:alhadisdemo/presentation/pages/loader/loader.dart';
import 'package:alhadisdemo/presentation/widgets/hadith_widget.dart';
import 'package:alhadisdemo/presentation/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../app/util/appbar_clipper.dart';

class HadithDetailsPage extends GetView<HadithDetailsController> {
  final int chapterId;
  final Book book;

  const HadithDetailsPage({required this.chapterId, required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadChapter(chapterId, book.id);
    return Obx(() => controller.loading.value
        ? const LoaderPage()
        : controller.error != null
            ? _errorView()
            : _pageView(context));
  }

  Widget _pageView(BuildContext context) => Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Theme.of(context).colorScheme.primary, elevation: 0),
      body: CustomScrollView(slivers: [
        _appbar(context),
        _body(context),
      ]));

  Widget _appbar(BuildContext context) => SliverAppBar(
      actions: [IconButton(onPressed: () {}, icon: const Icon(MyIcon.settings, color: Colors.white))],
      stretch: true,
      floating: true,
      toolbarHeight: 96,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: ListTile(
          textColor: Colors.white,
          title: Text('${controller.chapter.book.name}', style: const TextStyle(fontWeight: FontWeight.w900)),
          subtitle: Text(controller.chapter.title)),
      flexibleSpace:
          ClipPath(clipper: AppBarClipper(), child: Container(color: Theme.of(context).colorScheme.primary)));

  Widget _body(BuildContext context) => SliverToBoxAdapter(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // const SizedBox(height: Gap.regular),
        for (var section in controller.chapter.sections) ...[
          SectionWidget(section),
          for (var hadith in section.hadithList) HadithWidget(hadith, bookCode: '${book.code}', bookColor: book.color)
        ],
      ]));

  Widget _errorView() => Scaffold(
          body: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(MyString.error),
        ElevatedButton(onPressed: () => controller.loadChapter(chapterId, book.id), child: const Text(MyString.retry))
      ])));
}

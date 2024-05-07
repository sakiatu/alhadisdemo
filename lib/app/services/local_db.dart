import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb extends GetxService {
  late final Database _db;

  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'alhadith.db');

    final exists = await databaseExists(path);

    if (!exists) {
      await deleteDatabase(path);
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      final data = await rootBundle.load(join('assets', 'alhadith.db'));
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    }

    _db = await openDatabase(path);
  }

  Future<Map<String, dynamic>> getBook(int id) async {
    final data = await _db.query('books', where: 'id = ?', whereArgs: [id]);

    return data.first;
  }

  Future<Map<String, dynamic>> getChapter(int chapterId) async {
    final data = await _db.query('chapter', where: 'id = ?', whereArgs: [chapterId]);

    return data.first;
  }

  Future<List<Map<String, dynamic>>> getHadithOfChapter(int chapterId) async {
    return await _db.query('hadith', where: 'chapter_id = ?', whereArgs: [chapterId]);
  }

  Future<List<Map<String, dynamic>>> getSectionOfChapter(int chapterId) async {
    return await _db.query('section', where: 'chapter_id = ?', whereArgs: [chapterId]);
  }
}

import 'package:alhadisdemo/app/config/font.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class MyTheme {
  MyTheme._();

  static ThemeData get light => ThemeData(useMaterial3: true, colorScheme: _colorLight, textTheme: _textTheme);

  static ThemeData get dark => ThemeData(useMaterial3: true, colorScheme: _colorDark, textTheme: _textTheme);

  static get _colorLight => ColorScheme.fromSeed(
      seedColor: MyColor.seed, primary: MyColor.primary, background: MyColor.background, brightness: Brightness.light);

  static get _colorDark => ColorScheme.fromSeed(
      seedColor: MyColor.seed,
      primary: MyColor.primaryDark,
      background: MyColor.backgroundDark,
      surface: MyColor.surfaceDark,
      brightness: Brightness.dark);

  static get _textTheme => const TextTheme(
      titleLarge: TextStyle(fontSize: 22, height: 1.27),
      titleMedium: TextStyle(fontSize: 16, height: 1.5),
      titleSmall: TextStyle(fontSize: 14, height: 1.43),
      bodyLarge: TextStyle(fontSize: 16, fontFamily: MyFont.bangla, height: 1.5, letterSpacing: 0),
      bodyMedium: TextStyle(fontSize: 14, fontFamily: MyFont.bangla, height: 1.5, letterSpacing: 0),
      bodySmall: TextStyle(fontSize: 13, fontFamily: MyFont.bangla, height: 1.5, letterSpacing: 0),
      labelLarge: TextStyle(
          fontSize: 16, fontFamily: MyFont.bangla, height: 1.43, letterSpacing: 0, fontWeight: FontWeight.w900),
      labelMedium: TextStyle(
          fontSize: 14, fontFamily: MyFont.bangla, height: 1.5, letterSpacing: 0, fontWeight: FontWeight.w900),
      labelSmall: TextStyle(
          fontSize: 11, fontFamily: MyFont.bangla, height: 1.45, letterSpacing: 0, fontWeight: FontWeight.w900));
}

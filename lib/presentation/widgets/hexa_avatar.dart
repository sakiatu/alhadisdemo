import 'package:alhadisdemo/app/config/color.dart';
import 'package:flutter/material.dart';
import 'package:morphable_shape/morphable_shape.dart';

class HexaAvatar extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;

  const HexaAvatar({required this.text, this.color, this.size = 42, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: size,
      width: size,
      child: Material(
          shape: const PolygonShapeBorder(sides: 6, cornerRadius: Length(6), cornerStyle: CornerStyle.rounded),
          clipBehavior: Clip.antiAlias,
          color: color,
          child: Align(
              alignment: Alignment.center,
              child: Text(text, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: MyColor.white)))));
}

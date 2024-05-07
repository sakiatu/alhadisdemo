import 'package:flutter/material.dart';

import '../../app/config/size.dart';

class Box extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double radius;
  final EdgeInsets? padding;

  const Box({required this.child, this.color, this.radius = RadiusValue.regular, this.padding, super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: padding ?? const EdgeInsets.all(Gap.regular),
      decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(radius)),
      child: child);
}

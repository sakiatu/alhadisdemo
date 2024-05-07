import 'dart:ui';

import 'package:flutter/material.dart';

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..arcToPoint(Offset(20, size.height - 20), radius: const Radius.circular(20))
      ..lineTo(size.width - 20, size.height - 20)
      ..arcToPoint(Offset(size.width, size.height), radius: const Radius.circular(20))
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
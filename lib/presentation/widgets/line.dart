import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) =>
      Container(height: .1, decoration: BoxDecoration(color: Theme.of(context).colorScheme.outline));
}

import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double? size;
  final double stroke;

  const Loader({this.size, this.stroke = 4.0}) : super(key: null);

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(height: size, width: size, child: CircularProgressIndicator(strokeWidth: stroke)),
      );
}

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(body: Loader());
}

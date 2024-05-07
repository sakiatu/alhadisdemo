import 'package:alhadisdemo/app/config/color.dart';
import 'package:alhadisdemo/domain/entities/section.dart';
import 'package:alhadisdemo/presentation/widgets/box.dart';
import 'package:flutter/material.dart';

import '../../app/config/size.dart';
import 'line.dart';

class SectionWidget extends StatelessWidget {
  final Section section;

  const SectionWidget(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: Gap.regular, right: Gap.regular, bottom: Gap.regular),
        child: Box(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              width: double.infinity,
              child: Text.rich(
                  textAlign: TextAlign.justify,
                  TextSpan(children: [
                    TextSpan(
                        text: section.number,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: MyColor.textPrimary)),
                    if (section.title.isNotEmpty)
                      TextSpan(
                          text: ' ${section.title}',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(color: MyColor.textSecondary)),
                  ]))),
          if (section.preface.isNotEmpty) ...[
            const SizedBox(height: Gap.regular),
            const Line(),
            const SizedBox(height: Gap.regular),
            Text(section.preface,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.outline),
                textAlign: TextAlign.justify),
          ]
        ])));
  }
}

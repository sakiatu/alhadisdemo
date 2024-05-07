import 'package:alhadisdemo/app/config/color.dart';
import 'package:alhadisdemo/app/config/font.dart';
import 'package:alhadisdemo/domain/entities/hadith.dart';
import 'package:alhadisdemo/presentation/widgets/box.dart';
import 'package:alhadisdemo/presentation/widgets/hexa_avatar.dart';
import 'package:alhadisdemo/presentation/widgets/line.dart';
import 'package:flutter/material.dart';

import '../../app/config/size.dart';

class HadithWidget extends StatelessWidget {
  final Hadith hadith;
  final Color? bookColor;
  final String bookCode;

  const HadithWidget(this.hadith, {this.bookColor, required this.bookCode, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: Gap.regular, right: Gap.regular, bottom: Gap.regular),
        child: Box(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            HexaAvatar(text: bookCode, color: bookColor),
            const SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(hadith.bookName,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.w900, color: MyColor.textSecondary)),
              Text(hadith.number, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: MyColor.textPrimary)),
            ]),
            const Spacer(),
            Box(
                radius: RadiusValue.overLarge,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                color: Color(hadith.gradeColor),
                child: Text(hadith.grade, style: const TextStyle(color: MyColor.white, fontSize: 13))),
            IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                ),
                icon: Icon(Icons.more_vert, color: Theme.of(context).colorScheme.outline))
          ]),
          const SizedBox(height: Gap.regular),
          Text(hadith.arabicText,
              style: const TextStyle(fontFamily: MyFont.arabic, fontSize: 18, height: 2),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify),
          const SizedBox(height: Gap.regular),
          Text(hadith.narratorText,
              style: const TextStyle(color: MyColor.textPrimary, fontSize: 14), textAlign: TextAlign.justify),
          const SizedBox(height: 8),
          Text(hadith.banglaText, style: const TextStyle(fontSize: 14, height: 1.65), textAlign: TextAlign.justify),
          if (hadith.note.isNotEmpty) ...[
            const SizedBox(height: Gap.regular),
            const Line(),
            const SizedBox(height: Gap.regular),
            Text(hadith.footerText,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.outline)),
          ]
        ])));
  }
}

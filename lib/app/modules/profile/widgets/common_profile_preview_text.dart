import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';

class CommonProfilePreviewText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign align;
  const CommonProfilePreviewText({Key? key,
    required this.text,
    required this.style,
    required this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.imageScaleX2),
      child: Text(
          text,
          style: style,
      ),
    );
  }
}

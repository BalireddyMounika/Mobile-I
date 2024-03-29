import 'package:flutter/material.dart';

import '../../../data/values/dimens.dart';
import '../../../themes/app_styles.dart';

class CommonEventTitle extends StatelessWidget {
  final String text;

  const CommonEventTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.scaleX5, left: Dimens.scaleX5),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(text, style: AppStyles.tsBlackBold20)),
    );
  }
}

// ignore: must_be_immutable
class CommonEventText extends StatelessWidget {
  final String text;
  Color? textColor = Colors.black;

  CommonEventText({
    Key? key,
    required this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.gapX0_5, right: Dimens.gapX2),
      child: Text(text,
          style: AppStyles.tsBlackRegular14.copyWith(color: textColor)),
    );
  }
}

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

class CommonEventText extends StatelessWidget {
  final String text;

  const CommonEventText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: Dimens.scaleX2, left: Dimens.scaleX3, right: Dimens.scaleX3),
      child: Text(text, style: AppStyles.tsBlackMedium14),
    );
  }
}

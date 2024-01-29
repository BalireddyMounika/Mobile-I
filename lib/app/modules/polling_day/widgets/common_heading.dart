import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class CommonHeading extends StatelessWidget {
  String? leadingText;
  String text;
  Color? textColor = AppColors.black;
  CommonHeading({
    Key? key,
    required this.leadingText,
    this.text = "",
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$leadingText : ",
          style: AppStyles.tsBlackBold16.copyWith(color: textColor),
        ),
        Text(
          "$text",
          style: AppStyles.tsBlackBold14.copyWith(color: textColor),
        )
      ],
    ).paddingOnly(bottom: Dimens.gapX1);
  }
}

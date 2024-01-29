import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class PollingContainerRow extends StatelessWidget {
  final String startSvg;
  final Widget endSvg;
  final String text;
  final bool isendSvgbgColor;
  final Function()? onTap;

  PollingContainerRow({
    required this.startSvg,
    required this.endSvg,
    required this.text,
    this.isendSvgbgColor = true,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          startSvg,
          height: 20,
        ),
        SizedBox(
          width: Dimens.gapX1,
        ),
        Text(
          text,
          style: AppStyles.tsBlackRegular14,
          overflow: TextOverflow.ellipsis,
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                  color: isendSvgbgColor ? Colors.white : AppColors.transparent,
                  shape: BoxShape.circle),
              child: endSvg),
        ),
      ],
    ).paddingSymmetric(
        horizontal: Dimens.paddingX4, vertical: Dimens.paddingX1);
  }
}

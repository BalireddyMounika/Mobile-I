import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class CustomSwitchButton extends StatelessWidget {
  Function? onTapping;
  final String leftText;
  final String leftSvg;
  final String rightText;
  final String rightSvg;
  bool isswitchValue;

  CustomSwitchButton({
    required this.onTapping,
    required this.leftText,
    required this.leftSvg,
    required this.rightText,
    required this.rightSvg,
    required this.isswitchValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapping?.call();
        print(isswitchValue);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 45,
            decoration: BoxDecoration(
                color:
                    isswitchValue ? AppColors.baseColor : AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.greyColor,
                      blurStyle: BlurStyle.normal,
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0.5)
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Row(
              children: [
                SvgPicture.asset(
                  leftSvg,
                  colorFilter: isswitchValue
                      ? ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)
                      : ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                  width: 20,
                ).paddingOnly(left: Dimens.gapX2),
                Text(
                  leftText,
                  style: isswitchValue
                      ? AppStyles.tswhiteColorRegular16
                      : AppStyles.tsBlackRegular16,
                ).paddingOnly(left: Dimens.gapX1)
              ],
            ),
          ),
          Container(
            width: 100,
            height: 45,
            decoration: BoxDecoration(
              color:
                  !isswitchValue ? AppColors.baseColor : AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                    color: AppColors.greyColor,
                    blurStyle: BlurStyle.normal,
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0.5)
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  rightSvg,
                  colorFilter: !isswitchValue
                      ? ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)
                      : ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                  width: 20,
                ).paddingOnly(left: Dimens.gapX2),
                Text(
                  rightText,
                  style: !isswitchValue
                      ? AppStyles.tswhiteColorRegular16
                      : AppStyles.tsBlackRegular16,
                ).paddingOnly(left: Dimens.gapX1)
              ],
            ),
          )
        ],
      ),
    ).paddingOnly(top: Dimens.gapX1);
  }
}

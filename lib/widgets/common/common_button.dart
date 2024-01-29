import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class CommonFilledButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double height;
  final double radius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isDisable;
  final bool? isFilled;
  final Color? color;
  final bool? isBorder;
  final bool textColor;

  const CommonFilledButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
    this.suffixIcon,
    this.prefixIcon,
    this.height = 50,
    this.radius = Dimens.radiusX4,
    this.isDisable = false,
    this.color,
    this.isFilled,
    this.isBorder,
    this.textColor = true,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isFilled ?? true
            ? color ?? AppColors.baseColor
            : AppColors.transparent,
        border: isBorder ?? true
            ? Border.all(color: AppColors.baseColor)
            : Border.all(color: AppColors.transparent),
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      child: MaterialButton(
        onPressed: isDisable ?? false ? null : onTap,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? SizedBox(),
            Text(
              text,
              style: textColor
                  ? height < 40
                      ? isFilled ?? true
                          ? AppStyles.tsBlackBold14.copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: fontWeight,
                              fontSize: fontSize)
                          : AppStyles.tsBlackBold14
                      : isFilled ?? true
                          ? AppStyles.tsBlackBold18.copyWith(
                              color: AppColors.whiteColor,
                              fontWeight: fontWeight,
                              fontSize: fontSize)
                          : AppStyles.tsBlackBold18
                  : AppStyles.tsBlackBold18.copyWith(color: AppColors.black),
            ),
            suffixIcon ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}

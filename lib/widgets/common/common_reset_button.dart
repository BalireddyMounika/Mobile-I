import 'package:flutter/material.dart';

import '../../app/data/values/dimens.dart';
import '../../app/themes/app_colors.dart';
import '../../app/themes/app_styles.dart';

class CommonResetButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double height;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isDisable;
  final bool? isFilled;
  final Color? color;

  const CommonResetButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.width,
    this.suffixIcon,
    this.prefixIcon,
    this.height = 50,
    this.isDisable = false,
    this.color,
    this.isFilled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isFilled ?? true
            ? color ?? AppColors.transparent
            : AppColors.transparent,
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(Dimens.radiusX4),
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
              style: height < 40
                  ? isFilled ?? true
                  ? AppStyles.tsBlackBold14
                  .copyWith(color: AppColors.whiteColor)
                  : AppStyles.tsBlackBold14
                  : isFilled ?? true
                  ? AppStyles.tsBlackBold18
                  .copyWith(color: AppColors.black)
                  : AppStyles.tsBlackBold18,
            ),
            suffixIcon ?? SizedBox(),
          ],
        ),
      ),
    );
  }
}
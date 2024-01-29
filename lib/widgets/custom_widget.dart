import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

// Common Button //

class CustomButton extends StatelessWidget {
  final String buttonName;
  final IconData? icon;
  final onTap;
  CustomButton({required this.buttonName, this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: Dimens.imageScaleX5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient:
                LinearGradient(colors: [Color(0xffFF7A5C), Color(0xffF04A3D)])),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buttonName, style: AppStyles.tswhiteColorRegular16),
            SizedBox(width: Dimens.gapX2),
            icon != null
                ? Icon(icon, size: 20, color: AppColors.whiteColor)
                : SizedBox(),
          ],
        )),
      ),
    );
  }
}

// EDIT PAGE FEILDS //

class CommonEditFeild extends StatelessWidget {
  final String text;
  final String? Value;

  CommonEditFeild({required this.text, this.Value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: Dimens.gapX4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: AppStyles.tsSecondaryRegular18,
              ),
            )),
        Padding(
            padding: EdgeInsets.only(
                left: Dimens.gapX2,
                right: Dimens.gapX2,
                top: Dimens.gapX1,
                bottom: Dimens.gapX1),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  borderSide: BorderSide(color: AppColors.whiteColor),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(Dimens.paddingX3),
                fillColor: AppColors.whiteColor,
              ),
              initialValue: Value,
              style: AppStyles.tsSecondaryRegular18,
            )),
      ],
    );
  }
}

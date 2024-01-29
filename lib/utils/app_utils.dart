import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class AppUtils {
  AppUtils._privateConstructor();

  static getDateFormat(String? value) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    return dateFormat.format(DateTime.parse(value!));
  }

  static getCurrencyFormat(double? value, {int? decimal = 2}) {
    final indianRupeesFormat = NumberFormat.currency(
      name: "INR",
      locale: 'en_IN',
      decimalDigits: decimal,
      symbol: '₹ ',
    );
    var formatedValue = indianRupeesFormat.format(value);
    return formatedValue;
  }

  static getNumberFormat(double? value) {
    NumberFormat format = NumberFormat.decimalPattern('hi');
    String newValue;
    if (value != null) {
      if (value.isNegative) {
        double pValue = value.roundToDouble();
        newValue = format.format(pValue);
        newValue = newValue != '0' ? newValue.replaceAll('-', '') : '0';
      } else {
        newValue = format.format(value.roundToDouble());
      }
      return newValue;
    } else {
      return "0";
    }
  }

  static showSnackBar(String text) {
    Get.rawSnackbar(
      
        snackPosition: SnackPosition.TOP,
        borderRadius: 20.0,
        borderColor: AppColors.secondaryColor,
        messageText: Text(
          text,
          style: AppStyles.tsBlackRegular14
              .copyWith(color: AppColors.whiteColor, letterSpacing: 0.2),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: AppColors.black.withOpacity(.6),
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 14.0));
  }

  static getBottomSheet({
    required List<Widget> children,
    bool? ignoreSafeAres,
    EdgeInsetsGeometry? padding,
    bool? isDisable,
  }) =>
      Get.bottomSheet(
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
          children: children,
        ),
        backgroundColor: AppColors.whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        isScrollControlled: true,
        ignoreSafeArea: ignoreSafeAres ?? false,
      );
}

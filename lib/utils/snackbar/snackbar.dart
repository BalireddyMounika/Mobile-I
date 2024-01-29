import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';

SnackbarController InfoSnackBar(title, message) {
  return Get.snackbar('', '',
      // backgroundColor: Colors.red,
      titleText: Text(
        title,
        style:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      ),
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15,color: Colors.green),
      ),
      duration: Duration(seconds: 2),
      colorText: AppColors.secondaryColor,
      snackPosition: SnackPosition.BOTTOM);
}

SnackbarController WarningSnackBar(title, message) {
  return Get.snackbar('', '',
      // backgroundColor: Colors.red,
      titleText: Text(
        title,
        style:
        TextStyle(fontWeight: FontWeight.bold, color: AppColors.baseColor),
      ),
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15),
      ),
      duration: Duration(seconds: 2),
      colorText: AppColors.secondaryColor,
      snackPosition: SnackPosition.BOTTOM);
}

SnackbarController ErrorSnackBar(title, message) {
  return Get.snackbar('', '',
      // backgroundColor: Colors.red,
      titleText: Text(
        title,
        style:
        TextStyle(fontWeight: FontWeight.bold, color: AppColors.baseColor),
      ),
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15),
      ),
      duration: Duration(seconds: 2),
      colorText: AppColors.secondaryColor,
      snackPosition: SnackPosition.BOTTOM);
}


// ERROR MESSAGE //

SnackbarController Error_message(title, message) {
  return Get.snackbar("", 'Please enter valid email',
      backgroundColor: AppColors.snackbarColor,
      titleText: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
      messageText: Text(
        message,
        style: TextStyle(fontSize: 15),
      ),
      duration: Duration(seconds: 2),
      colorText: AppColors.secondaryColor,
      snackPosition: SnackPosition.BOTTOM);
}
import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/common_input_field.dart';
import '../../../data/values/dimens.dart';
import '../../../themes/app_colors.dart';
import '../controller/profile_controller.dart';


class CommonSocialMediaContainer extends StatelessWidget {
  ProfileController controller = Get.find();

  final linkController;
  final descController;
  final VoidCallback onTapAddItems;
  final String titleText;

  CommonSocialMediaContainer({
    Key? key,
    required this.linkController,
    required this.descController,
    required this.onTapAddItems,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left:Dimens.gapX3),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              titleText,
              style:AppStyles.tsBlackBold16,
            )),
      ),
      Container(
        margin: EdgeInsets.only(
            top: Dimens.marginX4,
            left: Dimens.marginX4,
            right: Dimens.marginX4),
        width: Dimens.screenWidth,
        height: Dimens.imageScaleX16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.imageScaleX1),
          color: AppColors.whiteColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:Dimens.imageScaleX6,right:Dimens.imageScaleX6,top:Dimens.imageScaleX2),
              child: CommonInputField(wrapper:linkController,hintText:"Add Link",),
            ),
            Padding(
              padding: const EdgeInsets.only(left:Dimens.imageScaleX6,right:Dimens.imageScaleX6,top:Dimens.imageScaleX2),
              child: CommonInputField(wrapper:descController,hintText: "Add Description",),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: InkWell(
            child: Container(
              margin: EdgeInsets.only(right:Dimens.imageScaleX3),
              width: Dimens.imageScaleX3,
              height: Dimens.imageScaleX3,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor,
                  border: Border.all(color: AppColors.secondaryColor)),
              child: Icon(
                Icons.add,
                size:Dimens.imageScaleX2,
                color: AppColors.whiteColor,
              ),
            ),
            onTap:onTapAddItems),
      ),
    ]);
  }
}
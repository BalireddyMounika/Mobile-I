import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class CommonCompainEditView extends StatelessWidget {
  const CommonCompainEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Dimens.imageScaleX8,
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  color: AppColors.greyColor,
                  blurRadius: 4)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.DATA_ANALYTICS_VOTER_VIEW);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.CAMPAIGN_VIEW);
              },
              child: SizedBox(
                width: Dimens.screenWidthXFourth,
                child: const Center(
                  child: Text("Campaign", style: AppStyles.tsBlackRegular16),
                ),
              ),
            ),
            SizedBox(
                width: Dimens.screenWidthXFourth,
                child: const Center(
                  child: Text("|", style: AppStyles.tsBlackRegular16),
                )),
            InkWell(
                onTap: () {
                  Get.toNamed(Routes.EDIT_VIEW);
                },
                child: SizedBox(
                    width: Dimens.screenWidthXFourth,
                    child: const Center(
                      child: Text("Edit", style: AppStyles.tsBlackRegular16),
                    ))),
          ],
        ));
  }
}

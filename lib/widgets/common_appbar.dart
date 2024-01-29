import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/data/values/images.dart';
import 'package:prasada_political_portfolio/app/data/values/strings.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

PreferredSize CustomAppBar() => PreferredSize(
      preferredSize: Size.fromHeight(110),
      child: AppBar(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.secondaryColor,
        actions: [
          Image(
            image: AssetImage(AppImages.cycle),
            width: Dimens.screenWidthXEight,
          ).paddingOnly(right: Dimens.paddingX2)
        ],
        centerTitle: true,
        toolbarHeight: 110,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.prasad,
              height: Dimens.gapX6,
            ),
            const Text(AppStrings.prasadaraopyala,
                style: AppStyles.tswhiteColorRegular16),
            const Text(AppStrings.telugudesamparty,
                style: AppStyles.tswhiteColorRegular13),
            SizedBox(height: Dimens.gapX1)
          ],
        ),
      ),
    );

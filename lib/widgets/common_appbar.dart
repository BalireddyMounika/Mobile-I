import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/data/values/images.dart';
import 'package:prasada_political_portfolio/app/data/values/strings.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

PreferredSize CustomAppBar() => PreferredSize(
      preferredSize: Size.fromHeight(Dimens.screenHeightX8),
      child: AppBar(
        backgroundColor: AppColors.secondaryColor,
        actions: [
          Image(
            image: AssetImage(AppImages.cycle),
            width: Dimens.screenWidthXEight,
          )
        ],
        centerTitle: true,
        toolbarHeight: Dimens.screenHeightX8,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.prasad,
              height: Dimens.gapX6,
            ),
            Text(AppStrings.prasadaraopyala,
                style: AppStyles.tswhiteColorRegular16),
            Text(AppStrings.telugudesamparty,
                style: AppStyles.tswhiteColorRegular13),
          ],
        ),
      ),
    );

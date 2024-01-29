import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/images.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';

class Voter_slips extends StatelessWidget {
  const Voter_slips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(Dimens.gapX2),
      child: Center(
        child: Container(
          height: Dimens.screenHeightX21,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.toNamed(Routes.EDIT_VIEW);
                  },
                ),
              ),
              Image.asset(AppImages.voter_slip),
              Padding(
                  padding: const EdgeInsets.all(Dimens.gapX4),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.gapX2,
                              right: Dimens.gapX2,
                              top: Dimens.gapX3),
                          child: CommonFilledButton(
                            text: 'Download',
                            onTap: () {},
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.gapX2,
                              right: Dimens.gapX2,
                              top: Dimens.gapX2),
                          child: CommonFilledButton(
                            text: 'Share',
                            onTap: () {},
                            color: AppColors.snackbarColor,
                            isFilled: false,
                          )),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}

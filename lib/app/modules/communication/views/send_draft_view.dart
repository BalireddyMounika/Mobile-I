import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/common/common_button.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';

class CommunicationSentField extends StatelessWidget {
  CommunicationSentField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Dimens.screenHeightX21,
          width: Dimens.screenWidthX12,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.toNamed(Routes.CREATE_COMMUNICATION_VIEW);
                  },
                ),
              ),
              const Icon(
                Icons.check_circle_rounded,
                size: 100,
                color: Colors.green,
              ),
              const SizedBox(
                height: Dimens.gapX1,
              ),
              const Text(
                "Communication Successfully Sent",
                style: AppStyles.tsSecondaryRegular18,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.gapX3,
                      right: Dimens.gapX3,
                      top: Dimens.gapX6,
                      bottom: Dimens.gapX2),
                  child: CommonFilledButton(
                      text: "Back to Communication",
                      onTap: () {
                        Get.toNamed(Routes.COMMUNICATION);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

class CommunicationDraftField extends StatelessWidget {
  const CommunicationDraftField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: Dimens.screenHeightX21,
          width: Dimens.screenWidthX12,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.toNamed(Routes.CREATE_COMMUNICATION_VIEW);
                  },
                ),
              ),
              const Icon(
                Icons.drafts,
                size: 100,
                color: Color(0xff035CC5),
              ),
              const SizedBox(
                height: Dimens.gapX1,
              ),
              const Text(
                "Communication Saved As Draft",
                style: AppStyles.tsSecondaryRegular18,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.gapX3,
                      right: Dimens.gapX3,
                      top: Dimens.gapX6,
                      bottom: Dimens.gapX2),
                  child: CommonFilledButton(
                      text: "Back to Communication",
                      onTap: () {
                        Get.toNamed(Routes.COMMUNICATION);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}

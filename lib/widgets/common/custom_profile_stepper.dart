import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/values/dimens.dart';
import '../../app/modules/profile/controller/profile_controller.dart';
import '../../app/routes/app_routes.dart';

class CustomProfileStepper extends StatelessWidget {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    int currentStep = int.tryParse(controller.aboutYou.value) ?? 0;

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: Dimens.gapX10),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepTapped: (index) {
              controller.onChangeStepperValue(index.toString());
              switch (index) {
                case 0:
                  Get.toNamed(Routes.PROFILE_ABOUT_YOU, arguments: controller);
                  break;
                case 1:
                  Get.toNamed(Routes.PROFILE_CANDIDATE_INFO,
                      arguments: controller);
                  break;
                case 2:
                  Get.toNamed(Routes.PROFILE_POLITICAL_HISTORY,
                      arguments: controller);
                  break;
                case 3:
                  Get.toNamed(Routes.PROFILE_SOCIAL_MEDIA,
                      arguments: controller);
                  break;
                case 4:
                  Get.toNamed(Routes.PROFILE_EC_STATUS, arguments: controller);
                  break;
              }
              return null;
            },
            steps: [
              Step(
                title: Text(''),
                isActive: currentStep >= 0,
                content: SizedBox(),
              ),
              Step(
                title: Text(''),
                isActive: currentStep >= 1,
                content: SizedBox(),
              ),
              Step(
                title: Text(''),
                isActive: currentStep >= 2,
                content: SizedBox(),
              ),
              Step(
                title: Text(''),
                isActive: currentStep >= 3,
                content: SizedBox(),
              ),
              Step(
                title: Text(''),
                isActive: currentStep >= 4,
                content: SizedBox(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

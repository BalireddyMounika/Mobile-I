import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/modules/events/views/event_create_page.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';

import '../../app/data/values/dimens.dart';
import '../../app/modules/events/controllers/event_controller.dart';
import 'package:get/get.dart';

class CustomEventStepper extends StatelessWidget {
  EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    int currentStep = int.tryParse(controller.firstSection.value) ?? 0;

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints.tight(Size(Dimens.screenWidth,80.0)),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepTapped: (index) {
              controller.changeStepperValue(index.toString());
              switch (index) {
                case 0:
                  Get.toNamed(Routes.EVENT_CREATE_PAGE, arguments: controller);
                  break;
                case 1:
                  Get.toNamed(Routes.EVENT_SCHEDULE_PAGE, arguments: controller);
                  break;
                case 2:
                  Get.toNamed(Routes.EVENT_PLAN_PAGE, arguments: controller);
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
            ],
          ),
        ),
      ],
    );
  }
}

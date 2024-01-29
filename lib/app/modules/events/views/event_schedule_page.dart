import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/modules/events/controllers/event_controller.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/custom_event_stepper.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../widgets/common_event_title_text.dart';

class EventSchedulePage extends StatelessWidget {
  const EventSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 25.0,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    const Center(
                        child: Text(
                      "Events",
                      style: AppStyles.tsSecondaryRegular700,
                    )),
                  ],
                ),
                CustomEventStepper(),
              ],
            ),
          ),
          Expanded(child: EventScheduleData())
        ],
      ),
    );
  }
}

class EventScheduleData extends StatelessWidget {
  EventScheduleData({Key? key}) : super(key: key);

  EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
              Obx(
                () => controller.selectedEventStartDate.value != null &&
                        controller.selectedEventEndDate.value != null
                    ? Text(
                        "${controller.getDaysInBetween()}",
                        style: AppStyles.tsBlackMedium14,
                      )
                    : const Text("Select Date Ranges"),
              ),
              const CommonEventTitle(text: 'Schedule'),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: Dimens.scaleX5, top: Dimens.scaleX3),
                    width: Dimens.imageScaleX24,
                    height: Dimens.imageScaleX7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.gapX2),
                      color: AppColors.whiteColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          final formattedStartTime =
                              controller.getFormattedStartTime();
                          return Text(formattedStartTime);
                        }),
                        InkWell(
                          child: const Icon(Icons.access_time_outlined),
                          onTap: () {
                            controller.chooseEventStartTime();
                          },
                        )
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: Dimens.paddingX4),
                          child: Text(
                            "Start Time",
                            style: AppStyles.tsSecondaryRegular700,
                          ))
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: Dimens.scaleX5, top: Dimens.scaleX3),
                      width: Dimens.imageScaleX24,
                      height: Dimens.imageScaleX7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.gapX2),
                        color: AppColors.whiteColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            final formattedScheduleTime =
                                controller.getFormattedScheduleTime();
                            return Text(formattedScheduleTime);
                          }),
                          InkWell(
                            child: const Icon(Icons.access_time_outlined),
                            onTap: () {
                              controller.chooseEventScheduleTime();
                            },
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: Dimens.paddingX5),
                      child: Text(
                        "End Time",
                        style: AppStyles.tsSecondaryRegular700,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.imageScaleX4),
                child: CommonInputField(
                  wrapper: controller.eventPlaceTextController,
                  hintText: 'Type your description',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: Dimens.paddingX3, right: Dimens.paddingX5),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: const Text("+ Add Schedule Fields",
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline)),
                      onTap: () {
                        controller.onAddEventTimeList(
                            controller.getFormattedScheduleTime(),
                            controller.getFormattedStartTime(),
                            controller
                                .eventPlaceTextController.controller.text);
                        controller.removeEventScheduleTime();
                        controller.eventPlaceTextController.controller.clear();
                      },
                    )),
              ),
              Obx(() => controller.eventTimeListItems.isEmpty
                  ? const Text('')
                  : Column(
                      children: List.generate(
                          controller.eventTimeListItems.length, (index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  Text(controller.eventStartTimeList[index]),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimens.paddingX2,
                                        right: Dimens.paddingX2),
                                    child: Text("to"),
                                  ),
                                  Text(controller.eventTimeList[index])
                                ],
                              ),
                              subtitle:
                                  Text(controller.eventTimePlaceList[index]),
                              trailing: InkWell(
                                child: const Icon(Icons.cancel_outlined),
                                onTap: () {
                                  controller.onRemoveEventTimeList(index);
                                },
                              ),
                            ),
                          ],
                        );
                      }, growable: true),
                    )),
              Padding(
                padding: const EdgeInsets.all(Dimens.imageScaleX2),
                child: CommonFilledButton(
                    text: "Saved Next",
                    onTap: () {
                      Get.toNamed(Routes.EVENT_PLAN_PAGE);
                    }),
              )
            ],
          );
        });
  }
}

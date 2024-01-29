import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/common_input_field.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common/list_selector.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';

import '../controllers/communication_view_controller.dart';

class CommunicationView extends StatelessWidget {
  CommunicationViewController controller =
      Get.put(CommunicationViewController());
  CommunicationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.baseColor,
          foregroundColor: AppColors.whiteColor,
          onPressed: () {
            Get.toNamed(Routes.COMMUNICATION_SEARCH_VIEW);
          },
          label: const Text(
            "Create Communication",
            style: AppStyles.tswhiteColorRegular16,
          ),
        ),
        appBar: CustomAppBar(),
        drawer: HeaderDrawer(),
        body:  Column(children: [
          Container(
            width: Dimens.screenWidthX10,
            height: Dimens.imageScaleX7,
            decoration: const BoxDecoration(
                color: AppColors.snackbarColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black38,
                      blurRadius: 4)
                ]),
            child: const Center(
                child: Text(
              "Communication Module",
              style: AppStyles.tsSecondaryRegular700,
            )),
          ),
    Flexible(
    child: SingleChildScrollView(
    child: Column(
    children: [     Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.gapX3, right: Dimens.gapX3, top: Dimens.gapX4),
              child: ListSelector(
                onTap: (viewAll) async {
                  controller.viewall.controller.text = viewAll;
                },
                title: "View All",
                data: const ["View All", "Sent", "Draft"],
                child: CommonInputField(
                  wrapper: controller.viewall,
                  hintText: "View All",
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                ),
              )),
          const SizedBox(
            height: Dimens.gapX2,
          ),
          Obx(() => controller.communication.isEmpty
              ? const Text("")
              : Column(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.gapX3,
                          right: Dimens.gapX3,
                          bottom: Dimens.gapX3),
                      child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.SENT_VIEW);
                          },
                          child: Container(
                            height: Dimens.screenHeightXFourth,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimens.gapX1,
                                    right: Dimens.gapX1,
                                    bottom: Dimens.gapX1),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Row(children: [
                                        Icon(Icons.chat),
                                        SizedBox(
                                          width: Dimens.gapX2,
                                        ),
                                        Text("Telugu Desam Women \n Campaign"),
                                        SizedBox(
                                          width: Dimens.gapX10,
                                        ),
                                        Icon(Icons.message_outlined)
                                      ]),
                                      Row(children: [
                                        const Icon(Icons.rotate_left_outlined),
                                        const SizedBox(
                                          width: Dimens.gapX2,
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sent",
                                              style: TextStyle(
                                                  color: AppColors.blue),
                                            ),
                                            Obx(
                                              () => Text(
                                                'Sent on:${controller.currentDate.value} | ${controller.currentTime.value} | ${controller.currentDay.value}',
                                              ),
                                            ),
                                          ],
                                        ))
                                      ]),
                                      const Row(
                                        children: [
                                          Icon(Icons.people_outline),
                                          SizedBox(width: Dimens.gapX3),
                                          Column(
                                            children: [
                                              Text("50",
                                                  style: AppStyles
                                                      .tsBlueRegular16),
                                              Text("Total",
                                                  style: AppStyles
                                                      .tsBlueRegular16),
                                            ],
                                          ),
                                          SizedBox(width: Dimens.gapX3),
                                          Column(
                                            children: [
                                              Text("46",
                                                  style: AppStyles
                                                      .tsGreenRegular16),
                                              Text("sent",
                                                  style: AppStyles
                                                      .tsGreenRegular16),
                                            ],
                                          ),
                                          SizedBox(width: Dimens.gapX3),
                                          Column(
                                            children: [
                                              Text("4",
                                                  style: AppStyles
                                                      .tsBaseRegular14),
                                              Text("bounce",
                                                  style: AppStyles
                                                      .tsBaseRegular14),
                                            ],
                                          )
                                        ],
                                      ),
                                    ])),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.gapX3,
                          right: Dimens.gapX3,
                          bottom: Dimens.gapX3),
                      child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.DRAFT_VIEW);
                          },
                          child: Container(
                            height: Dimens.screenHeightXFourth,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimens.gapX1,
                                    right: Dimens.gapX1,
                                    bottom: Dimens.gapX1),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Row(children: [
                                        Icon(Icons.chat),
                                        SizedBox(
                                          width: Dimens.gapX2,
                                        ),
                                        Text("Telugu Desam Women \n Campaign"),
                                        SizedBox(
                                          width: Dimens.gapX10,
                                        ),
                                        Icon(Icons.event)
                                      ]),
                                      Row(children: [
                                        const Icon(Icons.rotate_left_outlined),
                                        const SizedBox(
                                          width: Dimens.gapX2,
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Draft",
                                              style: TextStyle(
                                                  color: AppColors.blue),
                                            ),
                                            Obx(
                                              () => Text(
                                                'Last updated on:${controller.currentDate.value} | ${controller.currentTime.value} | ${controller.currentDay.value}',
                                              ),
                                            ),
                                          ],
                                        ))
                                      ]),
                                    ])),
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.gapX3,
                          right: Dimens.gapX3,
                          bottom: Dimens.gapX3),
                      child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: Dimens.screenHeightXFourth,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimens.gapX1,
                                    right: Dimens.gapX1,
                                    bottom: Dimens.gapX1),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Row(children: [
                                        Icon(Icons.chat),
                                        SizedBox(
                                          width: Dimens.gapX2,
                                        ),
                                        Text("Telugu Desam Women \n Campaign"),
                                        SizedBox(
                                          width: Dimens.gapX10,
                                        ),
                                        Icon(Icons.lightbulb)
                                      ]),
                                      Row(children: [
                                        const Icon(Icons.rotate_left_outlined),
                                        const SizedBox(
                                          width: Dimens.gapX2,
                                        ),
                                        Expanded(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sent",
                                              style: TextStyle(
                                                  color: AppColors.blue),
                                            ),
                                            Obx(
                                              () => Text(
                                                'Sent on:${controller.currentDate.value} | ${controller.currentTime.value} | ${controller.currentDay.value}',
                                              ),
                                            ),
                                          ],
                                        ))
                                      ]),
                                      const Row(
                                        children: [
                                          Icon(Icons.people_outline),
                                          SizedBox(width: Dimens.gapX3),
                                          Column(
                                            children: [
                                              Text("50",
                                                  style: AppStyles
                                                      .tsBlueRegular16),
                                              Text("Total",
                                                  style: AppStyles
                                                      .tsBlueRegular16),
                                            ],
                                          ),
                                          SizedBox(width: Dimens.gapX3),
                                          Column(
                                            children: [
                                              Text("46",
                                                  style: AppStyles
                                                      .tsGreenRegular16),
                                              Text("sent",
                                                  style: AppStyles
                                                      .tsGreenRegular16),
                                            ],
                                          ),
                                          SizedBox(width: Dimens.gapX3),
                                          Column(
                                            children: [
                                              Text("4",
                                                  style: AppStyles
                                                      .tsBaseRegular14),
                                              Text("bounce",
                                                  style: AppStyles
                                                      .tsBaseRegular14),
                                            ],
                                          )
                                        ],
                                      ),
                                    ])),
                          ))),
                ]))
        ])))]));
  }
}

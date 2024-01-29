import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/inside_outside_controller.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/common_reset_button.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';

class InsideOutsideView extends GetView<InsideOutsideController> {
  const InsideOutsideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller
        .getInsideMarkedPollingData(AppStorage.getUser().email.toString());
    return WillPopScope(
      onWillPop: () async {
        print("popped");
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.secondaryColor,
            centerTitle: true,
            title:
                Text('Polling Booth', style: AppStyles.tswhiteColorRegular18)),
        body: Obx(
          () => ColoredBox(
            color: controller.isSwitchStatus.value
                ? Color(0xffF04A3D).withOpacity(0.1)
                : AppColors.whiteColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Switch and DropDown
                  Container(
                    color: AppColors.secondaryColor,
                    child: Row(children: [
                      SizedBox(
                        width: Dimens.screenWidthX17,
                        child: ListSelector(
                            child: CommonInputField(
                                suffixIcon: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 40,
                                ),
                                hintText: "Polling Stations",
                                wrapper: controller.pollingStations),
                            onTap: (value) {
                              print(value);
                              controller.setSelected(value);
                            },
                            title: "Polling Station",
                            data: controller.dropDownList),
                      ).paddingOnly(left: 10, right: 10, bottom: 10),
                      GestureDetector(
                        onTap: () {
                          controller.onSwitchSelect();
                          print(controller.isSwitchStatus);
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: controller.isSwitchStatus.value
                                      ? AppColors.baseColor
                                      : AppColors.secondaryColor,
                                  border: Border.all(
                                      width: 2, color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.input_rounded,
                                    color: Colors.white,
                                    size: controller.isSwitchStatus.value
                                        ? 22
                                        : 20,
                                  ),
                                  Text(
                                    "IN",
                                    style: AppStyles.tsWhiteBold14,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 70,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: !controller.isSwitchStatus.value
                                      ? AppColors.baseColor
                                      : AppColors.secondaryColor,
                                  border: Border.all(
                                      width: 2, color: AppColors.whiteColor),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.output_rounded,
                                    color: Colors.white,
                                    size: !controller.isSwitchStatus.value
                                        ? 22
                                        : 20,
                                  ),
                                  Text(
                                    "OUT",
                                    style: AppStyles.tsWhiteBold14,
                                  )
                                ],
                              ),
                            )
                          ],
                        ).paddingOnly(bottom: 10),
                      ),
                    ]),
                  ),
                  // Marked , UnMarked & Total
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonFilledButton(
                                  text:
                                      'Voted ( ${controller.noofMarkedVotes}/${controller.noofVotes} )',
                                  onTap: () {
                                    AppUtils.getBottomSheet(children: [
                                      SizedBox(
                                          height: 400,
                                          child: Obx(
                                            () => Container(
                                              child:
                                                  controller.selected.value ==
                                                          ""
                                                      ? Center(
                                                          child: Text(
                                                            "select",
                                                            style: AppStyles
                                                                .tsBlackBold22,
                                                          ),
                                                        )
                                                      : GridView.builder(
                                                          controller: controller
                                                              .scrollController,
                                                          physics:
                                                              ScrollPhysics(),
                                                          shrinkWrap: true,
                                                          itemCount: controller
                                                                  .isSwitchStatus
                                                                  .value
                                                              ? controller
                                                                  .insideMarkedVotersList
                                                                  .length
                                                              : controller
                                                                  .outsideMarkedVotersList
                                                                  .length,
                                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                              mainAxisSpacing:
                                                                  5,
                                                              crossAxisSpacing:
                                                                  5,
                                                              crossAxisCount:
                                                                  (MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          81)
                                                                      .toInt()),
                                                          itemBuilder:
                                                              (context, index) {
                                                            return GestureDetector(
                                                              onDoubleTap: () {
                                                                controller.isSwitchStatus
                                                                        .value
                                                                    ? controller.isInsideUpdated(
                                                                        controller
                                                                            .selected
                                                                            .value,
                                                                        controller.insideMarkedVotersList[
                                                                            index],
                                                                        false)
                                                                    : controller.isOutsideUpdated(
                                                                        controller
                                                                            .selected
                                                                            .value,
                                                                        controller
                                                                            .outsideMarkedVotersList[index],
                                                                        false);
                                                              },
                                                              child: Card(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        227,
                                                                        244,
                                                                        227),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                elevation: 4,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          "assets/images/poling.svg",
                                                                          height:
                                                                              35,
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .check_circle_rounded,
                                                                          color:
                                                                              Colors.green,
                                                                          size:
                                                                              15,
                                                                        ).paddingOnly(
                                                                            left:
                                                                                40),
                                                                      ],
                                                                    ).paddingOnly(
                                                                      top: Dimens
                                                                          .gapX0_5,
                                                                    ),
                                                                    Text(
                                                                      controller
                                                                              .isSwitchStatus
                                                                              .value
                                                                          ? controller.insideMarkedVotersList[index]
                                                                              .toString()
                                                                          : controller
                                                                              .outsideMarkedVotersList[index]
                                                                              .toString(),
                                                                      style: AppStyles
                                                                          .tsBlackBold16,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).paddingOnly(
                                                          left: Dimens.gapX1,
                                                          right: Dimens.gapX1),
                                            ),
                                          )),
                                    ]);
                                  })
                              .paddingOnly(
                                  left: Dimens.gapX1, right: Dimens.gapX0_5),
                        ),
                        Expanded(
                          child: CommonResetButton(
                                  prefixIcon: Icon(Icons.download_rounded),
                                  text: "  Download",
                                  onTap: () {
                                    print(controller.selected.value);
                                  })
                              .paddingOnly(
                                  left: Dimens.gapX0_5, right: Dimens.gapX1),
                        )
                      ],
                    ).paddingOnly(top: Dimens.gapX1),
                  ),

                  // Checkboxexxx
                  Expanded(
                      child: controller.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : SingleChildScrollView(
                              controller: controller.scrollController,
                              physics: const BouncingScrollPhysics(),
                              child: Container(
                                child: controller
                                        .outsideUnMarkedVotersList.isEmpty
                                    ? SizedBox(
                                        height: Dimens.screenWidthX10,
                                        child: Center(
                                          child: Text(
                                            "Select a Polling Station",
                                            style: AppStyles.tsBlackBold22,
                                          ),
                                        ),
                                      )
                                    : GridView.builder(
                                        physics: ScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.isSwitchStatus.value
                                                ? controller
                                                    .insideUnMarkedVotersList
                                                    .length
                                                : controller
                                                    .outsideUnMarkedVotersList
                                                    .length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5,
                                                crossAxisCount:
                                                    (MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            81)
                                                        .toInt()),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onDoubleTap: () {
                                              controller.isSwitchStatus.value
                                                  ? controller.isInsideUpdated(
                                                      controller.selected.value,
                                                      controller
                                                              .insideUnMarkedVotersList[
                                                          index],
                                                      true)
                                                  : controller.isOutsideUpdated(
                                                      controller.selected.value,
                                                      controller
                                                              .outsideUnMarkedVotersList[
                                                          index],
                                                      true);
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/images/poling.svg",
                                                    height: 35,
                                                  ),
                                                  Text(
                                                    controller.isSwitchStatus
                                                            .value
                                                        ? "${controller.insideUnMarkedVotersList[index]}"
                                                        : "${controller.outsideUnMarkedVotersList[index]}",
                                                    style:
                                                        AppStyles.tsBlackBold14,
                                                  ),
                                                ],
                                              ).paddingOnly(
                                                top: Dimens.gapX0_5,
                                              ),
                                            ),
                                          );
                                        },
                                      ).paddingOnly(
                                        top: Dimens.gapX0_5,
                                        left: Dimens.gapX1,
                                        right: Dimens.gapX1),
                              ),
                            )),
                ]),
          ),
        ),
      ),
    );
  }
}

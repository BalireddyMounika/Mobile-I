import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/modules/events/widgets/common_event_title_text.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/polling_day_view_controller.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/widgets/common_heading.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_container.dart';
import 'package:prasada_political_portfolio/widgets/common/common_text.dart';
import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PollingDayView extends GetView<PollingDayViewController> {
  const PollingDayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: HeaderDrawer(),
        body: Column(
          children: [
            Container(
              width: Dimens.screenWidth,
              child: const Text(
                "Polling Booth",
                textAlign: TextAlign.center,
                style: AppStyles.tsBlackBold18,
              ),
            ).paddingOnly(top: Dimens.gapX2),
            Expanded(
              child: Obx(
                () => controller.isLoadingData.value
                    ? Center(child: const CircularProgressIndicator())
                    : controller.allStationsNameNumIncharge.isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                controller.allStationsNameNumIncharge.length,
                            itemBuilder: (context, index) {
                              return CommonContainer(
                                backGroundColor: AppColors.whiteColor,
                                radius: 20,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/poolingDesk.svg',
                                          height: 22,
                                        ),
                                        Text(
                                          controller.allStationsNameNumIncharge[
                                              index]['PollingStation'],
                                          style: AppStyles.tsBlackRegular16,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            AppUtils.getBottomSheet(children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CommonHeading(
                                                            textData:
                                                                "Booth incharge info")
                                                        .paddingOnly(
                                                            left: Dimens
                                                                .screenWidthXFourth),
                                                    CommonText(
                                                            text: controller
                                                                .allStationsNameNumIncharge[
                                                                    index][
                                                                    'Booth_Incharge']
                                                                .toString())
                                                        .paddingOnly(
                                                            left: Dimens.gapX2,
                                                            top: Dimens.gapX1),
                                                    Text(
                                                      '+91-${controller.allStationsNameNumIncharge[index]['Booth_Incharge_Number']}',
                                                      style: TextStyle(
                                                        color: AppColors.blue,
                                                        fontSize: 20,
                                                      ),
                                                    ).paddingOnly(
                                                        left: Dimens.gapX2,
                                                        top: Dimens.gapX1),
                                                    InkWell(
                                                      onTap: () async {
                                                        var phoneNumber =
                                                            '+91${controller.allStationsNameNumIncharge[index]['Booth_Incharge_Number'].toString()}'; // Replace with the actual phone number
                                                        if (await canLaunchUrlString(
                                                            'tel:$phoneNumber')) {
                                                          await launchUrlString(
                                                              'tel:$phoneNumber');
                                                        } else {
                                                          throw 'Could not launch $phoneNumber';
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                            color: AppColors
                                                                .baseColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                        width: 100,
                                                        height: 40,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            const Icon(
                                                              Icons.phone,
                                                              color: AppColors
                                                                  .whiteColor,
                                                            ),
                                                            const Text(
                                                              "Call",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ],
                                                        ),
                                                      ).paddingOnly(
                                                          left: Dimens
                                                              .screenWidthXThird,
                                                          top: Dimens.gapX2),
                                                    ),
                                                    CommonHeading(
                                                            textData:
                                                                "Mandal incharge info")
                                                        .paddingOnly(
                                                            left: Dimens
                                                                .screenWidthXFourth,
                                                            top: Dimens.gapX2),
                                                    CommonText(
                                                            text: controller
                                                                .allStationsNameNumIncharge[
                                                                    index][
                                                                    'Mandal_Incharge']
                                                                .toString())
                                                        .paddingOnly(
                                                            left: Dimens.gapX2,
                                                            top: Dimens.gapX1),
                                                    Text(
                                                            '+91-${controller.allStationsNameNumIncharge[index]['Mandal_Incharge_Number']}',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .blue,
                                                              fontSize: 20,
                                                            ))
                                                        .paddingOnly(
                                                            left: Dimens.gapX2,
                                                            top: Dimens.gapX1),
                                                    InkWell(
                                                      onTap: () async {
                                                        var phoneNumber =
                                                            '+91${controller.allStationsNameNumIncharge[index]['Mandal_Incharge_Number'].toString()}'; // Replace with the actual phone number
                                                        if (await canLaunchUrlString(
                                                            'tel:$phoneNumber')) {
                                                          await launchUrlString(
                                                              'tel:$phoneNumber');
                                                        } else {
                                                          throw 'Could not launch $phoneNumber';
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                            color: AppColors
                                                                .baseColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                        width: 100,
                                                        height: 40,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            const Icon(
                                                              Icons.phone,
                                                              color: AppColors
                                                                  .whiteColor,
                                                            ),
                                                            const Text(
                                                              "Call",
                                                              style: TextStyle(
                                                                  color: AppColors
                                                                      .whiteColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            )
                                                          ],
                                                        ),
                                                      ).paddingOnly(
                                                          left: Dimens
                                                              .screenWidthXThird,
                                                          top: Dimens.gapX2),
                                                    ),
                                                  ]),
                                            ]);
                                            print(controller
                                                .pollingStationList[index]);
                                          },
                                          child: SvgPicture.asset(
                                            'assets/images/iconamoon_profile2.svg',
                                            height: 50,
                                          ),
                                        )
                                      ],
                                    ).paddingOnly(
                                        left: Dimens.gapX2,
                                        right: Dimens.gapX1),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/profiles.svg',
                                          height: 25,
                                        ),
                                        Text(
                                            "${controller.allStationsNameNumIncharge[index]["Total_Voters"]} = ${controller.allStationsNameNumIncharge[index]["Voted"]} + ${controller.allStationsNameNumIncharge[index]["pendingVoters"]}",
                                            style: AppStyles.tsBlackRegular16),
                                        GestureDetector(
                                          onTap: () {
                                            AppUtils.getBottomSheet(children: [
                                              Container(
                                                child: Column(children: [
                                                  Column(
                                                    children: [
                                                      CommonHeading(
                                                          textData:
                                                              "Total Votes"),
                                                      CommonEventText(
                                                          text:
                                                              "Male : ${controller.allStationsNameNumIncharge[index]["Total_Male"]}"),
                                                      CommonEventText(
                                                          text:
                                                              "Female : ${controller.allStationsNameNumIncharge[index]["Total_Female"]}"),
                                                      CommonEventText(
                                                          text:
                                                              "Third : ${controller.allStationsNameNumIncharge[index]["total_others"]}"),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          CommonHeading(
                                                              textData:
                                                                  "Voted"),
                                                          CommonEventText(
                                                              text:
                                                                  "Male : ${controller.allStationsNameNumIncharge[index]["Male_Voted"]}"),
                                                          CommonEventText(
                                                              text:
                                                                  "Female : ${controller.allStationsNameNumIncharge[index]["Female_Voted"]}"),
                                                          CommonEventText(
                                                              text:
                                                                  "Third : ${controller.allStationsNameNumIncharge[index]["total_other_voted"]}"),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          CommonHeading(
                                                              textData:
                                                                  "Pending"),
                                                          CommonEventText(
                                                              text:
                                                                  "Male : ${controller.allStationsNameNumIncharge[index]["pending_voter_data_Male"]}"),
                                                          CommonEventText(
                                                              text:
                                                                  "Female : ${controller.allStationsNameNumIncharge[index]["pending_voter_data_Female"]}"),
                                                          CommonEventText(
                                                              text:
                                                                  "Third : ${controller.allStationsNameNumIncharge[index]["pending_voter_data_others"]}"),
                                                        ],
                                                      )
                                                    ],
                                                  ).paddingOnly(
                                                      top: Dimens.gapX2)
                                                ]),
                                              )
                                            ]);
                                          },
                                          child: SvgPicture.asset(
                                            'assets/images/iconamoon_profile.svg',
                                            height: 50,
                                          ),
                                        ),
                                      ],
                                    ).paddingOnly(
                                        left: Dimens.gapX2,
                                        right: Dimens.gapX1),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/profiles.svg',
                                          height: 25,
                                        ),
                                        Text(
                                            "${controller.allStationsNameNumIncharge[index]["stats"]}/${controller.allStationsNameNumIncharge[index]["PartyInclination_tdp"]}",
                                            style: AppStyles.tsBlackRegular16),
                                        controller.allStationsNameNumIncharge[
                                                    index]['trend'] ==
                                                "Trailing"
                                            ? Icon(
                                                Icons.arrow_downward_rounded,
                                                size: 35,
                                                color: AppColors.YellowColor,
                                              )
                                            : Icon(
                                                Icons.arrow_upward_rounded,
                                                size: 35,
                                                color: AppColors.green,
                                              ),
                                      ],
                                    ).paddingOnly(
                                        left: Dimens.gapX2,
                                        right: Dimens.gapX2 - Dimens.gapX0_5),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.1139,
                                      height: Dimens.scaleX6,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  width: 1,
                                                  color: Colors.black))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CommonFilledButton(
                                                isBorder: false,
                                                isFilled: false,
                                                prefixIcon: const Icon(
                                                    Icons.download_rounded),
                                                text: "  Download",
                                                onTap: () {}),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: Dimens.scaleX6,
                                              decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: CommonFilledButton(
                                                  isBorder: false,
                                                  isFilled: true,
                                                  prefixIcon: SvgPicture.asset(
                                                    "assets/images/poling.svg",
                                                    color: AppColors.whiteColor,
                                                  ),
                                                  text: "  Pooling Booth",
                                                  onTap: () {
                                                    controller
                                                        .selectedPollingStation
                                                        .value = controller
                                                            .allStationsNameNumIncharge[
                                                        index]['PollingStation'];
                                                    if (controller
                                                            .selectedPollingStation
                                                            .value ==
                                                        controller.allStationsNameNumIncharge[
                                                                index][
                                                            'PollingStation']) {
                                                      Get.toNamed(
                                                          Routes
                                                              .INSIDE_OUTSIDE_VIEW,
                                                          arguments: controller
                                                                      .allStationsNameNumIncharge[
                                                                  index][
                                                              'PollingStation']);
                                                    }
                                                  }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).paddingOnly(top: Dimens.gapX1)
                                  ],
                                ).paddingOnly(top: Dimens.gapX1),
                              ).paddingOnly(top: 20);
                            })
                        : const Center(
                            child: Text('No Data Found'),
                          ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: Dimens.gapX2));
  }
}

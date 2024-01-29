import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/data/values/images.dart';
import 'package:prasada_political_portfolio/app/modules/events/widgets/common_event_title_text.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/polling_day_view_controller.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/widgets/common_heading.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/widgets/common_incharge_details.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/widgets/polling_container_row.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/widgets/common/common_container.dart';
import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

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
                "Polling  Booth",
                textAlign: TextAlign.center,
                style: AppStyles.tsBlackBold18,
              ),
            ).paddingOnly(top: Dimens.gapX2, bottom: Dimens.gapX1),
            Expanded(
              child: Obx(
                () => controller.isLoadingData.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.allStationsNameNumIncharge.isNotEmpty
                        ? ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemCount:
                                controller.allStationsNameNumIncharge.length,
                            itemBuilder: (context, index) {
                              return CommonContainer(
                                backGroundColor: AppColors.whiteColor,
                                radius: 20,
                                child: Column(
                                  children: [
                                    PollingContainerRow(
                                        onTap: () {
                                          AppUtils.getBottomSheet(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Dimens.paddingX2,
                                                  vertical: Dimens.paddingX3),
                                              children: [
                                                pollingBoothsDetails(index)
                                              ]);
                                        },
                                        startSvg: AppImages.ic_pooling_desk,
                                        endSvg: SvgPicture.asset(
                                          'assets/images/iconamoon_profile2.svg',
                                          height: 35,
                                        ),
                                        text: controller
                                            .allStationsNameNumIncharge[index]
                                                ['PollingStation']
                                            .toString()),
                                    PollingContainerRow(
                                        onTap: () {
                                          AppUtils.getBottomSheet(children: [
                                            pollingVotesDetails(index)
                                                .paddingOnly(top: Dimens.gapX1)
                                          ]);
                                        },
                                        startSvg: AppImages.ic_profile,
                                        endSvg: SvgPicture.asset(
                                          'assets/images/iconamoon_profile.svg',
                                          height: 35,
                                        ),
                                        text:
                                            "${controller.allStationsNameNumIncharge[index]["Total_Voters"]} = ${controller.allStationsNameNumIncharge[index]["Voted"]} + ${controller.allStationsNameNumIncharge[index]["pendingVoters"]}"),
                                    PollingContainerRow(
                                        startSvg: AppImages.ic_profile,
                                        endSvg: const Icon(
                                          Icons.trending_up,
                                          size: 30,
                                          color: AppColors.green,
                                        ),
                                        isendSvgbgColor: false,
                                        text:
                                            "${controller.allStationsNameNumIncharge[index]["stats"]}/${controller.allStationsNameNumIncharge[index]["PartyInclination_tdp"]}"),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 1,
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
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                  height: Dimens.scaleX6,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.download,
                                                        size: 22,
                                                      ).paddingOnly(
                                                          right: Dimens.gapX1),
                                                      Flexible(
                                                        child: Text(
                                                          'Download',
                                                          style: AppStyles
                                                              .tsBlackMedium14
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .black),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ).paddingOnly(
                                                            right:
                                                                Dimens.gapX2),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
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
                                                            index]
                                                        ['PollingStation']) {
                                                  Get.toNamed(
                                                      Routes
                                                          .INSIDE_OUTSIDE_VIEW,
                                                      arguments: controller
                                                              .allStationsNameNumIncharge[
                                                          index]['PollingStation']);
                                                }
                                              },
                                              child: Container(
                                                  height: Dimens.scaleX6,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SvgPicture.asset(
                                                        "assets/images/poling.svg",
                                                        color: AppColors
                                                            .whiteColor,
                                                        height: Dimens.scaleX3,
                                                      ).paddingOnly(
                                                          right: Dimens.gapX1),
                                                      Flexible(
                                                        child: Text(
                                                          'Polling Booth',
                                                          style: AppStyles
                                                              .tsBlackMedium14
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .whiteColor),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ).paddingOnly(
                                                            right:
                                                                Dimens.gapX2),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).paddingOnly(top: Dimens.gapX1)
                                  ],
                                ).paddingOnly(top: Dimens.gapX1),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: Dimens.gapX1,
                            ),
                          )
                        : const Center(
                            child: Text('No Data Found'),
                          ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: Dimens.paddingX2));
  }

  Widget pollingBoothsDetails(index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CommonInChargeDetails(
          inChargePossition: 'Booth Incharge',
          inChargeName: controller.allStationsNameNumIncharge[index]
                  ['Booth_Incharge']
              .toString(),
          inChargeNumber:
              '+91-${controller.allStationsNameNumIncharge[index]['Booth_Incharge_Number']}'),
      Divider().paddingSymmetric(
          horizontal: Dimens.screenWidthX38, vertical: Dimens.gapX1),
      CommonInChargeDetails(
          inChargePossition: 'Mandal Incharge',
          inChargeName: controller.allStationsNameNumIncharge[index]
                  ['Mandal_Incharge']
              .toString(),
          inChargeNumber:
              '+91-${controller.allStationsNameNumIncharge[index]['Mandal_Incharge_Number']}'),
      Divider().paddingSymmetric(
          horizontal: Dimens.screenWidthX38, vertical: Dimens.gapX1),
      CommonInChargeDetails(
          inChargePossition: 'Cluster Incharge',
          inChargeName: controller.allStationsNameNumIncharge[index]
                  ['Cluster_Incharge']
              .toString(),
          inChargeNumber:
              '+91-${controller.allStationsNameNumIncharge[index]['Cluster_Incharge_Number']}'),
      Divider().paddingSymmetric(
          horizontal: Dimens.screenWidthX38, vertical: Dimens.gapX1),
      CommonInChargeDetails(
          inChargePossition: 'Unit Incharge',
          inChargeName: controller.allStationsNameNumIncharge[index]
                  ['Unit_Incharge']
              .toString(),
          inChargeNumber:
              '+91-${controller.allStationsNameNumIncharge[index]['Unit_Incharge_Number']}'),
    ]);
  }

  Widget pollingVotesDetails(index) {
    return Column(children: [
      Column(
        children: [
          CommonHeading(
              leadingText: "Total Votes",
              text:
                  "${controller.allStationsNameNumIncharge[index]["Total_Voters"]}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
        ],
      ),
      Divider(
        color: AppColors.black,
      ),
      Column(
        children: [
          CommonHeading(
              textColor: AppColors.green,
              leadingText: "Voted",
              text: "${controller.allStationsNameNumIncharge[index]["Voted"]}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonEventText(
                  textColor: AppColors.green,
                  text:
                      "Male : ${controller.allStationsNameNumIncharge[index]["Male_Voted"]}"),
              CommonEventText(
                  textColor: AppColors.green,
                  text:
                      "Female : ${controller.allStationsNameNumIncharge[index]["Female_Voted"]}"),
              CommonEventText(
                  textColor: AppColors.green,
                  text:
                      "Third : ${controller.allStationsNameNumIncharge[index]["total_other_voted"]}"),
            ],
          ),
        ],
      ),
      Divider(
        color: AppColors.black,
      ),
      Column(
        children: [
          CommonHeading(
              textColor: AppColors.YellowColor,
              leadingText: "Pending",
              text:
                  "${controller.allStationsNameNumIncharge[index]["pendingVoters"]}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonEventText(
                  textColor: AppColors.YellowColor,
                  text:
                      "Male : ${controller.allStationsNameNumIncharge[index]["pending_voter_data_Male"]}"),
              CommonEventText(
                  textColor: AppColors.YellowColor,
                  text:
                      "Female : ${controller.allStationsNameNumIncharge[index]["pending_voter_data_Female"]}"),
              CommonEventText(
                  textColor: AppColors.YellowColor,
                  text:
                      "Third : ${controller.allStationsNameNumIncharge[index]["pending_voter_data_others"]}"),
            ],
          ),
        ],
      ),
      Divider(
        color: AppColors.black,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeading(
              textColor: AppColors.blue,
              leadingText: "Non TDP",
              text:
                  "${controller.allStationsNameNumIncharge[index]["total_non_tdp_data"]}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonEventText(
                  textColor: AppColors.blue,
                  text:
                      "Male : ${controller.allStationsNameNumIncharge[index]["non_tdp_MaleCount"]}"),
              CommonEventText(
                  textColor: AppColors.blue,
                  text:
                      "Female : ${controller.allStationsNameNumIncharge[index]["non_tdp_FemaleCount"]}"),
              CommonEventText(
                  textColor: AppColors.blue,
                  text:
                      "Third : ${controller.allStationsNameNumIncharge[index]["non_tdp_Other_Count"]}"),
            ],
          ),
        ],
      )
    ]);
  }
}

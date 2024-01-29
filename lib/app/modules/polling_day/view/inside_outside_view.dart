import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/views/advance_data_analytic_voter_view.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/inside_outside_controller.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/widgets/commonGridViewBuilder.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import 'package:flutter/cupertino.dart';

class InsideOutsideView extends GetView<InsideOutsideController> {
  const InsideOutsideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: AppColors.whiteColor,
          backgroundColor: AppColors.secondaryColor,
          centerTitle: true,
          title: Text('Polling Booth', style: AppStyles.tswhiteColorRegular18),
          actions: [Obx(() => timerWidget())],
        ),
        body: ValueListenableBuilder<bool>(
            valueListenable: controller.isLoadingVoters,
            builder: (context, isLoading, child) {
              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _body(context);
            }));
  }

  Widget _body(context) {
    return Obx(
      () => ColoredBox(
        color: controller.isOutSideSelected.value
            ? Colors.white
            : Color(0xffF04A3D).withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // MarkedVoted and DropDown
            Container(
              color: AppColors.secondaryColor,
              child: Row(children: [
                Expanded(
                  child: ListSelector(
                      isListEnable: controller.isListSelectorEnabled.value,
                      child: CommonInputField(
                          suffixIcon: Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 40,
                          ),
                          hintText: "Polling Stations",
                          wrapper: controller.pollingStations),
                      onTap: (value) {
                        controller.setSelected(value);
                      },
                      title: "Polling Station",
                      data: controller.dropDownList),
                ),
                CommonFilledButton(
                    radius: Dimens.radiusX2,
                    textColor: false,
                    isBorder: false,
                    color: AppColors.whiteColor,
                    text:
                        'Voted ( ${controller.noofMarkedVotes}/${controller.totalVoters} )',
                    onTap: () {
                      AppUtils.getBottomSheet(children: [
                        SizedBox(
                            height: 400,
                            child: Obx(
                              () => Container(
                                child: controller
                                            .pollingStations.controller.text ==
                                        ""
                                    ? Center(
                                        child: Text(
                                          "select",
                                          style: AppStyles.tsBlackBold22,
                                        ),
                                      )
                                    : GridView.builder(
                                        physics: ScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            controller.isOutSideSelected.value
                                                ? controller
                                                    .outSideVotedVoters.length
                                                : controller
                                                    .insideVotedVoters.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5,
                                                crossAxisCount:
                                                    (MediaQuery.of(Get.context!)
                                                                .size
                                                                .width /
                                                            81)
                                                        .toInt()),
                                        itemBuilder: (context, index) {
                                          return CommonGridCard(
                                            isBgGreen: true,
                                            onDoubleTap: () {
                                              controller.isOutSideSelected.value
                                                  ? controller.onVote(
                                                      stationName: controller
                                                          .selected.value,
                                                      srNum: controller
                                                              .outSideVotedVoters[
                                                                  index]
                                                              .voterSerialNumber ??
                                                          "",
                                                      isValue: false,
                                                      index: index,
                                                    )
                                                  : controller.onVote(
                                                      stationName: controller
                                                          .selected.value,
                                                      srNum: controller
                                                              .insideVotedVoters[
                                                                  index]
                                                              .voterSerialNumber ??
                                                          "",
                                                      isValue: false,
                                                      index: index,
                                                    );
                                            },
                                            partyName: controller
                                                    .isOutSideSelected.value
                                                ? controller
                                                    .outSideVotedVoters[index]
                                                    .partyInclination
                                                : controller
                                                    .insideVotedVoters[index]
                                                    .partyInclination,
                                            srNumber: controller
                                                    .isOutSideSelected.value
                                                ? controller
                                                    .outSideVotedVoters[index]
                                                    .voterSerialNumber
                                                : controller
                                                    .insideVotedVoters[index]
                                                    .voterSerialNumber,
                                            nonLocalAddress: controller
                                                    .isOutSideSelected.value
                                                ? controller
                                                    .outSideVotedVoters[index]
                                                    .nonLocalAddress
                                                : controller
                                                    .insideVotedVoters[index]
                                                    .nonLocalAddress,
                                          );
                                        },
                                      ).paddingOnly(
                                        left: Dimens.gapX1,
                                        right: Dimens.gapX1),
                              ),
                            )),
                      ]);
                    }).paddingOnly(left: Dimens.gapX1),
              ]).paddingOnly(left: 10, right: 10, bottom: 10),
            ),
            // Switch

            Expanded(
              child: controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : CustomScrollView(
                      controller: controller.scrollController,
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                            automaticallyImplyLeading: false,
                            backgroundColor: AppColors.transparent,
                            scrolledUnderElevation: 0,
                            toolbarHeight: 65,
                            floating: true,
                            expandedHeight: 65,
                            flexibleSpace: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                inOutSwitch(
                                  value:
                                      '${controller.isOutSideSelected.value ? controller.outsideVoters.length : controller.insideVoters.length}',
                                ),
                              ],
                            ).paddingSymmetric(
                                horizontal: Dimens.paddingX2,
                                vertical: Dimens.gapX1)),
                        SliverToBoxAdapter(
                          child: SizedBox(height: Dimens.gapX1),
                        ),
                        // Replace with the number of items in your list
                        Obx(
                          () => SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    crossAxisCount:
                                        (Dimens.screenWidth / 81).toInt()),
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return CommonGridCard(
                                onDoubleTap: () {
                                  controller.onVote(
                                    stationName: controller.selected.value,
                                    srNum: controller.tempVoters[index]
                                            .voterSerialNumber ??
                                        "",
                                    index: index,
                                    isValue: true,
                                  );
                                },
                                partyName: controller
                                    .tempVoters[index].partyInclination,
                                srNumber: controller
                                    .tempVoters[index].voterSerialNumber,
                                nonLocalAddress: controller
                                    .tempVoters[index].nonLocalAddress,
                              );
                            }, childCount: controller.tempVoters.length),
                          ),
                        )
                      ],
                    ),
            ),

            controller.isListSelectorEnabled.value
                ? SizedBox()
                : Container(
                    height: Dimens.gapX7,
                    child: CupertinoActivityIndicator(
                      radius: 20,
                    ),
                  ),

            Row(
              children: [
                Expanded(
                  child: Wrap(
                    runSpacing: 5,
                    spacing: 10,
                    children: List.generate(controller.partyListandColor.length,
                        (index) => _buildPartyFlag(index)),
                  ),
                ),
                SpeedDial(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.secondaryColor,
                  animatedIcon: AnimatedIcons.menu_close,
                  child: Icon(Icons.add),
                  children: [
                    SpeedDialChild(
                      labelStyle: AppStyles.tsBlackMedium14
                          .copyWith(color: AppColors.baseColor),
                      onTap: () {
                        pdfViewer(context);
                      },
                      child: Icon(
                        Icons.cloud_download_outlined,
                      ),
                      label: 'Download',
                    ),
                    SpeedDialChild(
                        labelStyle: AppStyles.tsBlackMedium14
                            .copyWith(color: AppColors.baseColor),
                        onTap: () {
                          AppUtils.getBottomSheet(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimens.paddingX1,
                                  horizontal: Dimens.paddingX2),
                              children: [_filterWidget()]);
                        },
                        child: Icon(Icons.filter_alt_outlined),
                        label: 'Filter'),
                  ],
                ),
              ],
            ).paddingSymmetric(
                horizontal: Dimens.paddingX2, vertical: Dimens.gapX1)
          ],
        ),
      ),
    );
  }

  Widget _buildPartyFlag(index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        controller.partyListandColor[index].containsKey('color')
            ? Container(
                width: 20,
                height: 8,
                child: Material(
                  shape: StadiumBorder(side: BorderSide(width: 0)),
                  color: controller.partyListandColor[index]['color'],
                ),
              ).paddingOnly(right: Dimens.gapX0_5)
            : SvgPicture.asset(
                "${controller.partyListandColor[index]["svg"]}",
                width: 20, // Set the width according to your requirements
                height: 20, // Set the height according to your requirements
              ).paddingOnly(right: Dimens.gapX0_5),
        Text(
          controller.partyListandColor[index]['text'],
          style: AppStyles.tsBlackBold14,
        ),
      ],
    ).paddingOnly(left: Dimens.gapX1);
  }

  Widget inOutSwitch({required String value}) {
    return GestureDetector(
      onTap: () {
        controller.onSwitchSelect();
        print(controller.isOutSideSelected);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _switchBtn(
            name: 'Out',
            iconPath: 'assets/images/out.svg',
            value: value,
            isSelected: controller.isOutSideSelected.value,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
          ),
          _switchBtn(
              name: 'In',
              iconPath: 'assets/images/in.svg',
              value: value,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              isSelected: !controller.isOutSideSelected.value),
        ],
      ),
    );
  }

  Widget _switchBtn(
      {required String name,
      required String iconPath,
      required String value,
      required BorderRadiusGeometry borderRadius,
      required bool isSelected}) {
    return Container(
      height: 45,
      width: (Dimens.screenWidth / 2) - 24,
      decoration: BoxDecoration(
          color: isSelected ? AppColors.baseColor : AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
                color: AppColors.greyColor,
                blurStyle: BlurStyle.normal,
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0.5)
          ],
          borderRadius: borderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            // "assets/images/out.svg",
            colorFilter: isSelected
                ? ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn)
                : ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            width: 20,
          ),
          SizedBox(width: Dimens.gapX1),
          Text(
            name,
            style: isSelected
                ? AppStyles.tswhiteColorRegular16
                : AppStyles.tsBlackRegular16,
          ),
          SizedBox(width: Dimens.gapX0_5),
          Visibility(
            visible: isSelected,
            child: Text(
              '($value)',
              style: isSelected
                  ? AppStyles.tswhiteColorRegular16
                  : AppStyles.tsBlackRegular16,
            ),
          )
        ],
      ).paddingSymmetric(horizontal: Dimens.paddingX3),
    );
  }

  Widget timerWidget() {
    return Text(
      '${controller.time.value}',
      style: AppStyles.tsBlackMedium18.copyWith(color: AppColors.baseColor),
    ).paddingSymmetric(horizontal: Dimens.gapX2, vertical: 15);
  }

  Widget _filterWidget() {
    return Column(
      children: [
        Divider(thickness: 4)
            .paddingSymmetric(horizontal: Dimens.screenWidth / 3),
        Column(
          children: List.generate(
            controller.filterOptions.length,
            (index) => Obx(
              () => CustomCheckBox(
                  onChecked: () {
                    controller.addToSelectedFilterOptions(
                        controller.filterOptions.values.elementAt(index));
                  },
                  name: controller.filterOptions.keys.elementAt(index),
                  isActive: controller.selectedFilterOption.contains(
                      controller.filterOptions.values.elementAt(index))),
            ),
          ),
        ),
        Container(
            height: 1, color: AppColors.greyColor, width: Dimens.screenWidth),
        SizedBox(height: Dimens.gapX1),
        Obx(
          () => CustomCheckBox(
              onChecked: () {
                controller.isLocalSelected.value =
                    !controller.isLocalSelected.value;
              },
              name: 'Local',
              isActive: controller.isLocalSelected.value),
        ),
        Obx(
          () => CustomCheckBox(
              onChecked: () {
                controller.isNonLocalSelected.value =
                    !controller.isNonLocalSelected.value;
              },
              name: 'Non - Local',
              isActive: controller.isNonLocalSelected.value),
        ),
        SizedBox(height: Dimens.gapX2),
        CommonFilledButton(
                height: 42,
                radius: Dimens.radiusX2,
                text: "Apply Filter",
                onTap: () {
                  controller.applyFilter();
                })
            .paddingSymmetric(
                horizontal: Dimens.paddingX2, vertical: Dimens.gapX1)
      ],
    );
  }

  void pdfViewer(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                "Download Excel ?",
                style: AppStyles.tsBlackMedium16,
              ).paddingOnly(top: Dimens.gapX1),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("No")),
                TextButton(
                    onPressed: () {
                      controller.downloadPDF(
                          stationName: controller.selected.value);

                      Navigator.of(context).pop();
                    },
                    child: Text("Yes"))
              ],
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/response/VoterResponse.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/controllers/advance_data_analytics_search_controller.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/widgets/voder_card.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';

class AdvanceDataAnalyticsVoterView extends StatelessWidget {
  final AdvanceDataAnalyticSearchController controller =
      Get.put(AdvanceDataAnalyticSearchController());
  AdvanceDataAnalyticsVoterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.reset();
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leadingWidth: 120,
              leading: CommonFilledButton(
                  radius: Dimens.radiusX2,
                  isFilled: false,
                  height: 36,
                  prefixIcon: const Icon(Icons.sort_outlined),
                  text: 'Filter',
                  onTap: () => AppUtils.getBottomSheet(
                        isDisable: true,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Choose Option',
                                    style: AppStyles.tsBlackBold16),
                                const SizedBox(height: Dimens.gapX2),
                                Obx(
                                  () => Column(
                                    children: List.generate(
                                        controller.filterOptionList.length,
                                        (index) => CustomCheckBox(
                                              name: controller
                                                  .filterOptionList[index],
                                              isActive: controller
                                                  .selectedFilterOptionList
                                                  .contains(controller
                                                      .filterOptionList[index]),
                                              onChecked: () => controller
                                                  .onSelectFilterOption(
                                                      value: controller
                                                              .filterOptionList[
                                                          index]),
                                            )),
                                  ),
                                ),
                                SizedBox(height: Dimens.gapX2),
                                CommonFilledButton(
                                    text: 'Apply Filter',
                                    onTap: () {
                                      Get.back();
                                      controller.getFilterVoterList();
                                    })
                              ],
                            ),
                          )
                        ],
                      )).paddingAll(Dimens.paddingX2),
              title: Text(
                " Result : ${controller.tempVoterDataList.length}",
                style: AppStyles.tsSecondaryRegular700,
              ),
              centerTitle: true,
              actions: [
                Obx(() => Visibility(
                      visible: controller.selectedVoterDataList.length == 1,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.toNamed(Routes.UPDATE_VOTER_VIEW,
                                  arguments:
                                      controller.selectedVoterDataList.first);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                              onPressed: () => controller.getVoterSlipUrl(),
                              icon: const Icon(
                                Icons.credit_card,
                                color: AppColors.black,
                              )),
                          IconButton(
                              onPressed: () => controller.getFamilyVoterList(),
                              icon: const Icon(Icons.family_restroom,
                                  color: AppColors.black)),
                        ],
                      ),
                    )),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Obx(() => CustomCheckBox(
                  onChecked: () => controller.onCheckedSelectAll(),
                  isActive: controller.isSelectAllSelected.value,
                  name: 'Select All')),
            ),
            Expanded(
              child: ListView.separated(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.tempVoterDataList.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      VoterResponse voterResponse =
                          controller.tempVoterDataList[index];
                      return GestureDetector(
                        onTap: () => controller.onTapVoterCard(voterResponse),
                        onLongPress: () =>
                            controller.onLongPressVoterCard(voterResponse),
                        child: VoterCard(
                          isSelected: controller.selectedVoterDataList
                              .contains(voterResponse),
                          voterResponse: voterResponse,
                        ).paddingSymmetric(horizontal: Dimens.paddingX3),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: Dimens.gapX1,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Obx(
          () => Visibility(
            visible: controller.selectedVoterDataList.isNotEmpty,
            child: CommonFilledButton(
                    text: "Bulk Edit",
                    onTap: () {
                      if (controller.selectedVoterDataList.length == 1) {
                        Get.toNamed(Routes.SINGLE_CARD_CAMPAIGN_VIEW);
                      } else if (controller.selectedVoterDataList.length > 1) {
                        Get.toNamed(Routes.BULK_CARD_EDIT,
                            arguments: controller.ivinIdsList);
                      }
                    })
                .paddingSymmetric(
                    horizontal: Dimens.paddingX3, vertical: Dimens.paddingX2),
          ),
        ),
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final onChecked;
  final String name;
  final bool isActive;
  const CustomCheckBox(
      {Key? key, this.onChecked, required this.name, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onChecked,
      leading: isActive
          ? const Icon(
              Icons.check_box,
              color: AppColors.baseColor,
            )
          : const Icon(Icons.check_box_outline_blank),
      title: Text(name, style: AppStyles.tsBlackRegular14),
    );
  }
}

// Widget filterOptionWidget({required List<String> filterOption}) {
//   return GestureDetector(
//     onTap: () {},
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Choose Option', style: AppStyles.tsBlackBold16),
//         const SizedBox(height: Dimens.gapX2),
//         Column(
//           children: List.generate( filterOption.length,
//               (index) =>  CustomCheckBox(name: filterOption[index], isActive: false , onChecked:()=>  ,)),
//         ),
//       ],
//     ),
//   );
// }

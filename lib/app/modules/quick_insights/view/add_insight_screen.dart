import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/data/values/strings.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/views/advance_data_analytic_voter_view.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/controllers/quick_insight_controller.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

import '../../../../utils/helper/validators.dart';

class AddInsightsScreen extends GetView<QuickInsightController> {
  const AddInsightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.resetForm();
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  SizedBox(height: Dimens.gapX1),
                  const Text(AppStrings.createInsight,
                      style: AppStyles.tsSecondaryRegular700),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  ListSelector(
                    onTap: (constituency) {
                      controller.onSelectConstituency(
                          constituencyName: constituency);
                    },
                    title: AppStrings.constituency,
                    data: const ["Madugula", "Anakapalle"],
                    child: CommonInputField(
                      validator: mandatoryValidator,
                      wrapper: controller.constituency,
                      hintText: "Constituency Selection *",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  Obx(
                    () => ListSelector(
                      msgWhenListDisable: 'Please select Constituency',
                      onTap: (mandalName) async {
                        controller.onSelectMandal(mandalName: mandalName);
                      },
                      title: AppStrings.mandal,
                      data: controller.mandalList.value,
                      child: CommonInputField(
                        validator: mandatoryValidator,
                        wrapper: controller.mandal,
                        hintText: "Mandal Selection *",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  Obx(
                    () => ListSelector(
                      msgWhenListDisable: 'Please select Mandal',
                      onTap: (polingStation) {
                        controller.onSelectPolingStation(
                            polingStationNameAndNumber: polingStation);
                      },
                      isListEnable: controller.polingStationList.isNotEmpty,
                      title: AppStrings.pollingstationname,
                      data: controller.polingStationList.value,
                      child: CommonInputField(
                        validator: mandatoryValidator,
                        wrapper: controller.pollingstationnames,
                        hintText: "Polling Station Selection *",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  Obx(
                    () => ListSelector(
                      msgWhenListDisable: 'Please select Polling Station',
                      onTap: (value) {
                        controller.sectionNameAndnumber.controller.text = value;
                      },
                      isListEnable:
                          controller.sectionNameAndNumberList.isNotEmpty,
                      title: AppStrings.sectionnameandnumber,
                      data: controller.sectionNameAndNumberList.value,
                      child: CommonInputField(
                        validator: mandatoryValidator,
                        wrapper: controller.sectionNameAndnumber,
                        hintText: "Section Name and Number",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  CommonInputField(
                    wrapper: controller.name,
                    hintText: "Name (min 3 Letters)",
                  ),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  CommonInputField(
                    wrapper: controller.lastname,
                    hintText: "Enter Voter Last Name",
                  ),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  CommonInputField(
                    wrapper: controller.lastNameLikeSearch,
                    hintText: "Last Name Like Search",
                  ),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  CommonInputField(
                    wrapper: controller.house_no,
                    hintText: "House Number",
                  ),
                  const SizedBox(
                    height: Dimens.gapX3,
                  ),
                  // CommonInputField(
                  //   wrapper: controller.voter_id,
                  //   hintText: "Voter ID",
                  // ),
                  // const SizedBox(
                  //   height: Dimens.gapX3,
                  // ),
                  Row(
                    children: [
                      const Icon(
                        Icons.man,
                        size: 30,
                      ),
                      Obx(() => Expanded(
                            child: CustomCheckBox(
                                onChecked: () {
                                  if (controller.selectedGender.value !=
                                      'Male') {
                                    controller.toggleGender(name: 'Male');
                                  } else {
                                    controller.toggleGender(name: '');
                                  }
                                },
                                name: 'Male',
                                isActive:
                                    controller.selectedGender.value == 'Male'),
                          )),
                      SizedBox(width: Dimens.gapX2),
                      const Icon(
                        Icons.woman,
                        size: 30,
                      ),
                      Obx(() => Expanded(
                            child: CustomCheckBox(
                                onChecked: () {
                                  if (controller.selectedGender.value !=
                                      'Female') {
                                    controller.toggleGender(name: 'Female');
                                  } else {
                                    controller.toggleGender(name: '');
                                  }
                                },
                                name: 'Women',
                                isActive: controller.selectedGender.value ==
                                    'Female'),
                          )),
                    ],
                  ),
                  SizedBox(height: Dimens.gapX2),
                ],
              ).paddingSymmetric(horizontal: Dimens.paddingX3),
            ),
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: CommonFilledButton(
                isFilled: false,
                radius: Dimens.radiusX2,
                onTap: () => controller.resetForm(),
                text: AppStrings.reset,
              ).paddingSymmetric(vertical: Dimens.paddingX1),
            ),
            SizedBox(width: Dimens.gapX1),
            Expanded(
              child: CommonFilledButton(
                radius: Dimens.radiusX2,
                onTap: () =>
                    controller.getFilteredInsightData(callback: (bool success) {
                  if (success) {
                    Get.toNamed(Routes.INSIGHT_RESULT_PAGE);
                  }
                }),
                text: AppStrings.search,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: Dimens.paddingX3),
      ),
    );
  }
}

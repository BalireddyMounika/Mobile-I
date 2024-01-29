import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

import '../../../data/values/dimens.dart';
import '../../../data/values/strings.dart';
import '../../../themes/app_styles.dart';
import '../controllers/advance_data_analytics_search_controller.dart';

class AdvanceDataAnalyticsSearchView
    extends GetView<AdvanceDataAnalyticSearchController> {
  const AdvanceDataAnalyticsSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.resetSearchForm();
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        drawer: HeaderDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: Dimens.gapX1),
                const Text(AppStrings.advancedataanalytics,
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
                    isListEnable: controller.mandalList.isNotEmpty,
                    msgWhenListDisable: 'Please select Constituency',
                    onTap: (val) async {
                      controller.onSelectMandal(mandalName: val);
                    },
                    title: AppStrings.mandal,
                    data: controller.mandalList,
                    child: CommonInputField(
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
                    isListEnable: controller.polingStationList.isNotEmpty,
                    msgWhenListDisable: 'Please select Constituency',
                    onTap: (polingStation) => controller.onSelectPolingStation(
                        polingStationNameAndNumber: polingStation),
                    title: AppStrings.pollingstationname,
                    data: controller.polingStationList,
                    child: CommonInputField(
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
                    isListEnable:
                        controller.sectionNameAndNumberList.isNotEmpty,
                    msgWhenListDisable: 'Please select Polling Station',
                    onTap: (sectionnameandnumber) {
                      controller.sectionnameandnumber.controller.text =
                          sectionnameandnumber;
                      print(sectionnameandnumber);
                    },
                    title: AppStrings.sectionnameandnumber,
                    data: controller.sectionNameAndNumberList,
                    child: CommonInputField(
                      wrapper: controller.sectionnameandnumber,
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
                  wrapper: controller.last_name_like_search,
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
                CommonInputField(
                  wrapper: controller.voter_id,
                  hintText: "Voter ID",
                ),
                const SizedBox(
                  height: Dimens.gapX3,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.man,
                      size: 30,
                    ),
                    Obx(
                      () => Radio(
                        value: "MALE",
                        groupValue: controller.gender.value,
                        onChanged: (String? value) {
                          controller.gender.value = value ?? "MALE";
                        },
                      ),
                    ),
                    const Text(AppStrings.male),
                    const Spacer(),
                    const Icon(
                      Icons.woman,
                      size: 30,
                    ),
                    Obx(
                      () => Radio(
                        value: "FEMALE",
                        groupValue: controller.gender.value,
                        onChanged: (String? value) {
                          controller.genderfunction(value ?? 'FEMALE');
                        },
                      ),
                    ),
                    const Text(AppStrings.female),
                  ],
                ),
              ],
            ).paddingSymmetric(horizontal: Dimens.paddingX3),
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: CommonFilledButton(
                isFilled: false,
                radius: Dimens.radiusX2,
                onTap: () {
                  controller.resetSearchForm();
                },
                text: AppStrings.reset,
              ).paddingSymmetric(vertical: Dimens.paddingX1),
            ),
            SizedBox(width: Dimens.gapX1),
            Expanded(
              child: CommonFilledButton(
                radius: Dimens.radiusX2,
                onTap: () => controller.getVoterList(),
                text: AppStrings.search,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: Dimens.paddingX3),
      ),
    );
  }
}

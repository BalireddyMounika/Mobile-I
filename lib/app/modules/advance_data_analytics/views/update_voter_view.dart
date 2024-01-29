import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/controllers/update_voter_controller.dart';
import 'package:prasada_political_portfolio/utils/states.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

import '../../../../widgets/common/common_text.dart';
import '../../../data/values/dimens.dart';
import '../../../data/values/strings.dart';
import '../../../themes/app_colors.dart';

class UpdateVoterDataView extends GetView<UpdateVoterCardController> {
  const UpdateVoterDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.black,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Text('Voter Details'),
            centerTitle: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => Container(
                      height: 160,
                      width: double.infinity,
                      child: controller.isLoading.value
                          ? Center(child: const CircularProgressIndicator())
                          : Image.network(controller.voterRefImageUrl.value),
                    ),
                  ),
                  SizedBox(height: Dimens.gapX2),
                  CommonInputField(
                    hintText: 'Voter Id',
                    wrapper: controller.voterIdWrapper,
                  ),
                  const SizedBox(height: Dimens.gapX2),
                  CommonInputField(
                    hintText: 'Voter serial number',
                    wrapper: controller.serialNumWrapper,
                  ),
                  const SizedBox(height: Dimens.gapX2),
                  CommonInputField(
                    hintText: 'Name',
                    wrapper: controller.nameWrapper,
                  ),
                  const SizedBox(height: Dimens.gapX2),
                  CommonInputField(
                    hintText: 'Last Name',
                    wrapper: controller.lastNameWrapper,
                  ),
                  const SizedBox(height: Dimens.gapX2),
                  CommonInputField(
                    hintText: 'Dependent Name',
                    wrapper: controller.dependentNameWrapper,
                  ),
                  const SizedBox(height: Dimens.gapX2),
                  CommonInputField(
                    hintText: 'Dependent Relation',
                    wrapper: controller.dependentRelationWrapper,
                  ),
                  const SizedBox(height: Dimens.gapX2),
                  CommonInputField(
                    hintText: 'H.No',
                    wrapper: controller.houseNumWrapper,
                  ),
                  const SizedBox(height: Dimens.gapX2),
                  CommonInputField(
                    hintText: 'Age',
                    wrapper: controller.ageWrapper,
                  ),
                  const SizedBox(height: Dimens.gapX2),
                  const CommonText(text: "Gender"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      const SizedBox(
                        width: Dimens.gapX7,
                      ),
                      Obx(
                        () => Radio(
                          value: "FEMALE",
                          groupValue: controller.gender.value,
                          onChanged: (String? value) {
                            controller.gender.value = value ?? "FEMALE";
                            controller.genderfunction(controller.gender.value);
                          },
                        ),
                      ),
                      const Text(AppStrings.female),
                    ],
                  ),
                  const CommonText(text: "State"),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  ListSelector(
                    onTap: (state) async {
                      controller.onSelectState(stateName: state);
                    },
                    title: "State",
                    data: states,
                    child: CommonInputField(
                      wrapper: controller.state,
                      hintText: "Please Select State",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "District"),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Obx(
                    () => ListSelector(
                      isListEnable: controller.districtList.isNotEmpty,
                      msgWhenListDisable: 'Please choose state',
                      onTap: (district) async {
                        controller.onSelectDistrict(districtName: district);
                      },
                      title: "District",
                      data: controller.districtList,
                      child: CommonInputField(
                        wrapper: controller.district,
                        hintText: "Please Select District",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Constituency"),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Obx(
                    () => ListSelector(
                      onTap: (constituency) async {
                        controller.constituency.controller.text = constituency;
                      },
                      title: "Constituency",
                      data: controller.constituencyList.value,
                      child: CommonInputField(
                        wrapper: controller.constituency,
                        hintText: "Please Select Constituency",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Mandal"),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  ListSelector(
                    onTap: (mandal) async {},
                    title: "Mandal",
                    data: controller.mandalList,
                    child: CommonInputField(
                      wrapper: controller.mandal,
                      hintText: "Please Select Mandal",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Polling Station Name"),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Obx(
                    () => ListSelector(
                      onTap: (pollingStationName) async {
                        controller.pollingStationName.controller.text =
                            pollingStationName;
                      },
                      title: "Polling Station Name",
                      data: controller.polingStationList.value,
                      child: CommonInputField(
                        wrapper: controller.pollingStationName,
                        hintText: "Please Select Polling Station Name",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Section Number & Name"),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Obx(
                    () => ListSelector(
                      onTap: (sectionNumberName) async {},
                      title: "Section Number & Name",
                      data: controller.sectionNameAndNumberList.value,
                      child: CommonInputField(
                        wrapper: controller.sectionNumberName,
                        hintText: "Please Select Section Number & Name",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Polling Station Number"),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Obx(
                    () => ListSelector(
                      isListEnable:
                          controller.polingStationNumberList.isNotEmpty,
                      msgWhenListDisable: 'Please select poling station',
                      onTap: (pollingStationNumber) async {
                        controller.onSelectPolingStation(
                            polingStationName: pollingStationNumber);
                      },
                      title: "Polling Station Number",
                      data: controller.polingStationNumberList,
                      child: CommonInputField(
                        wrapper: controller.pollingStationNumber,
                        hintText: "Please Select Polling Station Number",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Polling Station Location"),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  ListSelector(
                    onTap: (pollingStationLocation) async {
                      controller.pollingStationLocation.controller.text =
                          pollingStationLocation;
                    },
                    title: "Polling Station Location",
                    data: const [
                      "Aided U P School, North room Peddirajupeta10",
                      "Aided U P School, North room Peddirajupeta11",
                      "Aided U P School, North room Peddirajupeta12",
                    ],
                    child: CommonInputField(
                      wrapper: controller.pollingStationLocation,
                      hintText: "Please Select Polling Station Location",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  const SizedBox(height: Dimens.gapX2),
                ],
              ).paddingSymmetric(horizontal: Dimens.paddingX3),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: CommonFilledButton(
              radius: Dimens.radiusX2,
              onTap: () => controller.updateVoterData(),
              text: AppStrings.update,
            ),
          ),
          const SizedBox(width: Dimens.gapX1),
          Expanded(
            child: CommonFilledButton(
              isFilled: false,
              radius: Dimens.radiusX2,
              onTap: () {
                Get.back();
                controller.resetPage();
              },
              text: AppStrings.cancel,
            ).paddingSymmetric(vertical: Dimens.paddingX1),
          ),
        ],
      ).paddingSymmetric(horizontal: Dimens.paddingX3),
    );
  }
}

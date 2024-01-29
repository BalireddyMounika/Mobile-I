import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/common/common_button.dart';
import '../../../../widgets/common/common_input_field.dart';
import '../../../../widgets/common/list_selector.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../data/values/strings.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../controllers/communication_search_view_controller.dart';

class CommunicationSearchView extends StatelessWidget {
  CommunicationSearchViewController controller = Get.find();
  CommunicationSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Dimens.gapX1),
            Text(
              "Communication Search",
              style: AppStyles.tsSecondaryRegular700,
            ),
            SizedBox(height: Dimens.gapX1),
            Flexible(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX3,
                        right: Dimens.gapX3,
                        top: Dimens.gapX2),
                    child: Column(
                      children: [
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
                            isListEnable:
                                controller.polingStationList.isNotEmpty,
                            msgWhenListDisable: 'Please select Constituency',
                            onTap: (polingStation) =>
                                controller.onSelectPolingStation(
                                    polingStationNameAndNumber: polingStation),
                            title: AppStrings.pollingstationname,
                            data: controller.polingStationList,
                            child: CommonInputField(
                              wrapper: controller.pollingStationNames,
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
                            onTap: (sectionNameAndNumber) {
                              controller.sectionNameAndNumber.controller.text =
                                  sectionNameAndNumber;
                              print(sectionNameAndNumber);
                            },
                            title: AppStrings.sectionnameandnumber,
                            data: controller.sectionNameAndNumberList,
                            child: CommonInputField(
                              wrapper: controller.sectionNameAndNumber,
                              hintText: "Section Name and Number",
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: Dimens.gapX2,
                        ),
                        CommonInputField(
                          wrapper: controller.name,
                          hintText: "Name",
                        ),
                        const SizedBox(
                          height: Dimens.gapX2,
                        ),
                        CommonInputField(
                          wrapper: controller.lastname,
                          hintText: "Last Name",
                        ),
                        const SizedBox(
                          height: Dimens.gapX2,
                        ),
                        CommonInputField(
                          wrapper: controller.houseNo,
                          hintText: "House Number",
                        ),
                        const SizedBox(
                          height: Dimens.gapX2,
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
                            const SizedBox(
                              width: Dimens.gapX7,
                            ),
                            const Icon(
                              Icons.woman,
                              size: 30,
                            ),
                            Obx(
                              () => Radio(
                                value: "FEMALE",
                                groupValue: controller.gender.value,
                                onChanged: (String? value) {
                                  controller.gender.value = value ?? "FEMALE";
                                  controller
                                      .genderFunction(controller.gender.value);
                                },
                              ),
                            ),
                            const Text(AppStrings.female),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => Text(
                                  "Search Result : ${controller.voterDataCount.value.toString()}",
                                  style: AppStyles.tsSecondaryRegular18,
                                )),
                            IconButton(
                                color: AppColors.blue,
                                onPressed: () {
                                  Get.toNamed(Routes.COMMUNICATION_FILTER_VIEW);
                                },
                                icon: const Icon(
                                  Icons.filter_alt_rounded,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: CommonFilledButton(
              radius: Dimens.radiusX2,
              onTap: () {
                controller.on_Reset_Page();
              },
              text: AppStrings.reset,
            ),
          ),
          SizedBox(width: Dimens.gapX2),
          Expanded(
            child: CommonFilledButton(
              radius: Dimens.radiusX2,
              isFilled: false,
              onTap: () {
                controller.getCommunicationFilteredVoter();
              },
              text: AppStrings.search,
            ),
          ),
        ],
      ).paddingSymmetric(
          horizontal: Dimens.paddingX3, vertical: Dimens.paddingX1),
    );
  }
}

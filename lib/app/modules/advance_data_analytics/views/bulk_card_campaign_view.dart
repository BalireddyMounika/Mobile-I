import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/views/advance_data_analytic_voter_view.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/common_text.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

import '../../../data/values/dimens.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../controllers/bulk_edit_campaign_details_controller.dart';

class BulkCardCampaignView extends GetView<BulkCardCampaignController> {
  const BulkCardCampaignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Dimens.gapX1),
          Text(
            "Campaign Bulk edit",
            style: AppStyles.tsSecondaryRegular700,
          ),
          SizedBox(height: Dimens.gapX1),
          Flexible(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonText(text: "Caste")
                      .paddingOnly(left: Dimens.gapX2),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  CommonInputField(
                    borderSide: false,
                    wrapper: controller.caste,
                    hintText: "Type here",
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Profession")
                      .paddingOnly(left: Dimens.gapX2),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  ListSelector(
                    onTap: (data) {
                      controller.professionNamesWrapper.controller.text = data;
                    },
                    title: "Profession Names",
                    data: const [
                      "Non political Desgination",
                      "Political Desgination",
                    ],
                    child: CommonInputField(
                      borderSide: false,
                      wrapper: controller.professionNamesWrapper,
                      hintText: "Please Select Profession Name",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Contact Number")
                      .paddingOnly(left: Dimens.gapX2),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  CommonInputField(
                    borderSide: false,
                    wrapper: controller.contactNumberWrapper,
                    hintText: "Type here",
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Party Inclination")
                      .paddingOnly(left: Dimens.gapX2),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  ListSelector(
                    onTap: (PartyInclination) {
                      controller.partyInclinationWrapper.controller.text =
                          PartyInclination;
                    },
                    title: "Party Inclination Names",
                    data: const [
                      "Telugu Desam Party",
                      "YSRCP",
                      "Yuvajana Sramika Rythu Congress Party"
                    ],
                    child: CommonInputField(
                      borderSide: false,
                      wrapper: controller.partyInclinationWrapper,
                      hintText: "Please Select Party Inclination Name",
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Obx(
                    () => CustomCheckBox(
                        onChecked: () {
                          controller.interestedToJoinParty.toggle();
                        },
                        name: 'Interested to join party',
                        isActive: controller.interestedToJoinParty.value),
                  ),
                  SizedBox(height: Dimens.gapX1),
                  Obx(() => CommonInputField(
                        borderSide: false,
                        wrapper: controller.interestedToJoinPartyWrapper,
                        hintText: "Information Given By Person",
                        isEnabled: controller.interestedToJoinParty.value,
                        onChanged: (text) {
                          controller.interestedToJoinPartyWrapper.controller
                              .text = text;
                        },
                      )),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Obx(() => CommonInputField(
                        borderSide: false,
                        wrapper: controller.interestedToJoinPartyComments,
                        hintText: "Comments",
                        isEnabled: controller.interestedToJoinParty.value,
                        onChanged: (text) {
                          controller.interestedToJoinPartyComments.controller
                              .text = text;
                        },
                      )),
                  SizedBox(height: Dimens.gapX1),
                  // Obx(
                  //   () => CustomCheckBox(
                  //     name: "Dissident",
                  //     isActive: controller.isDissidentChecked.value,
                  //     onChecked: () {
                  //       controller.isDissidentChecked.toggle();
                  //     },
                  //   ),
                  // ),
                  // SizedBox(height: Dimens.gapX1),
                  // Obx(
                  //   () => CommonInputField(
                  //     borderSide: false,
                  //     wrapper: controller.dissident,
                  //     hintText: "Information Given By Person",
                  //     isEnabled: controller.isDissidentChecked.value,
                  //     onChanged: (text) {
                  //       controller.dissident.controller.text = text;
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: Dimens.gapX1,
                  // ),
                  // Obx(() => CommonInputField(
                  //       borderSide: false,
                  //       wrapper: controller.dissidentCommentsWrapper,
                  //       hintText: "Comments",
                  //       isEnabled: controller.isDissidentChecked.value,
                  //       onChanged: (text) {
                  //         controller.dissidentCommentsWrapper.controller.text =
                  //             text;
                  //       },
                  //     )),
                  // SizedBox(height: Dimens.gapX1),
                  Obx(
                    () => CustomCheckBox(
                      name: "Is Voted",
                      isActive: controller.isVoted.value,
                      onChecked: () {
                        controller.isVoted.toggle();
                      },
                    ),
                  ),
                  SizedBox(height: Dimens.gapX1),
                  const CommonText(text: "Contact Mode")
                      .paddingOnly(left: Dimens.gapX2),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  ListSelector(
                      child: CommonInputField(
                        borderSide: false,
                        wrapper: controller.contactModeWrapper,
                        hintText: "Select",
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                      onTap: (value) {
                        controller.isContactMoodTeamContacted.value =
                            value == "TeamContacted";
                        controller.contactModeWrapper.controller.text = value;
                      },
                      title: "Contact Mode",
                      data: const [
                        '--Select--',
                        'PersonalContacted',
                        'TeamContacted'
                      ]),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Obx(
                    () => CommonInputField(
                      borderSide: false,
                      wrapper: controller.contactModeContactByWrapper,
                      hintText: "Contact By",
                      isEnabled: controller.isContactMoodTeamContacted.value,
                      onChanged: (text) {
                        controller.contactModeContactByWrapper.controller.text =
                            text;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Obx(() => CommonInputField(
                        borderSide: false,
                        wrapper: controller.contactModeCommentsWrapper,
                        hintText: "Comments",
                        isEnabled: controller.isContactMoodTeamContacted.value,
                        onChanged: (text) {
                          controller.contactModeCommentsWrapper.controller
                              .text = text;
                        },
                      )),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  const CommonText(text: "Master Data")
                      .paddingOnly(left: Dimens.gapX2),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  CommonText(text: "Last Name").paddingOnly(left: Dimens.gapX2),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  CommonInputField(
                    borderSide: false,
                    wrapper: controller.lastname,
                    hintText: "Select",
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                ],
              ).paddingSymmetric(horizontal: Dimens.paddingX3),
            ),
          )
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: CommonFilledButton(
              radius: Dimens.radiusX2,
              text: 'Update',
              onTap: () => controller.updateCampaignDetails(),
            ),
          ),
          SizedBox(width: Dimens.gapX1),
          Expanded(
            child: CommonFilledButton(
              radius: Dimens.radiusX2,
              text: 'Reset',
              onTap: () {
                controller.resetPage();
              },
              color: AppColors.snackbarColor,
              isFilled: false,
            ),
          ),
        ],
      ).paddingSymmetric(
          horizontal: Dimens.paddingX3, vertical: Dimens.paddingX2),
    );
  }
}

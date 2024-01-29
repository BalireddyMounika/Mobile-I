import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/strings.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/controllers/campaign_controller.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/common_text.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

import '../../../data/values/dimens.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';

class SingleCardCampaignView extends GetView<SingleCardCampaignController> {
  const SingleCardCampaignView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          SizedBox(height: Dimens.gapX1),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Campaign details",
              style: AppStyles.tsSecondaryRegular700,
            ),
          ),
          SizedBox(height: Dimens.gapX1),
          Flexible(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Obx(() => Switch(
                                value: controller.person_alive_status.value,
                                onChanged: controller.Person_Alive_Status,
                                activeColor: AppColors.green,
                                activeTrackColor: AppColors.greenshade,
                              )),
                          Obx(() => Text(
                                controller.person_alive_status.value
                                    ? 'Person Alive'
                                    : 'Person Dead',
                                style: AppStyles.tsSecondaryRegular18,
                              )),
                        ],
                      ),
                      const CommonText(text: "Caste"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => CommonInputField(
                            wrapper: controller.caste,
                            hintText: "Type here",
                            isEnabled: controller.person_alive_status.value,
                          )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Profession"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => controller.person_alive_status.value
                          ? ListSelector(
                              onTap: (Professionnames) {
                                controller.profession_names.controller.text =
                                    Professionnames;
                              },
                              title: "Profession Names",
                              data: const [
                                "Non political Desgination",
                                "Political Desgination",
                              ],
                              child: CommonInputField(
                                wrapper: controller.profession_names,
                                hintText: "Please Select Profession Name",
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                isEnabled: controller.person_alive_status.value,
                              ))
                          : CommonInputField(
                              wrapper: controller.profession_names,
                              hintText: "Please Select Profession Name",
                              isEnabled: false,
                            )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Contact Number"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => CommonInputField(
                            wrapper: controller.contact_number,
                            hintText: "Type here",
                            isEnabled: controller.person_alive_status.value,
                          )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Party Inclination"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => controller.person_alive_status.value
                          ? ListSelector(
                              onTap: (PartyInclination) {
                                controller.party_inclination.controller.text =
                                    PartyInclination;
                              },
                              title: "Party Inclination Names",
                              data: const [
                                "Telugu Desam Party",
                                "YSRCP",
                                "Yuvajana Sramika Rythu Congress Party"
                              ],
                              child: CommonInputField(
                                wrapper: controller.party_inclination,
                                hintText:
                                    "Please Select Party Inclination Name",
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                isEnabled: controller.person_alive_status.value,
                              ))
                          : CommonInputField(
                              wrapper: controller.party_inclination,
                              hintText: "Please Select Party Inclination Name",
                              isEnabled: false,
                            )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Strength"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => CommonInputField(
                            wrapper: controller.strength,
                            hintText: "Type here",
                            isEnabled: controller.person_alive_status.value,
                          )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Weakness"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => CommonInputField(
                            wrapper: controller.weakness,
                            hintText: "Type here",
                            isEnabled: controller.person_alive_status.value,
                          )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Contact Mode"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(
                        () => controller.person_alive_status.value
                            ? ListSelector(
                                child: CommonInputField(
                                  wrapper: controller.contact_mode,
                                  hintText: "Select",
                                  suffixIcon:
                                      const Icon(Icons.keyboard_arrow_down),
                                  isEnabled:
                                      controller.person_alive_status.value,
                                ),
                                onTap: (value) {
                                  controller.Contact_Mode_Dropdown_Value(
                                      value.toString());
                                  controller.contact_mode.controller.text =
                                      value;
                                },
                                title: "Contact Mode",
                                data: const [
                                    '--Select--',
                                    'PersonalContacted',
                                    'TeamContacted'
                                  ])
                            : CommonInputField(
                                wrapper: controller.contact_mode,
                                hintText: "Select",
                                isEnabled: controller.person_alive_status.value,
                              ),
                      ),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      Obx(() => CommonInputField(
                            wrapper: controller.contact_mode_contact_by,
                            hintText: "Contact By",
                            isEnabled:
                                controller.contact_mode_change_text_field.value,
                            onChanged: (text) {
                              controller.contact_mode_contact_by_text_feild
                                  .value = text;
                            },
                          )),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => CommonInputField(
                            wrapper: controller.contact_mode_comments,
                            hintText: "Comments",
                            isEnabled:
                                controller.contact_mode_change_text_field.value,
                            onChanged: (text) {
                              controller.contact_mode_comments_text_feild
                                  .value = text;
                            },
                          )),
                      Obx(() => CheckboxListTile(
                            title: const Text("Non Local Address"),
                            value: controller.non_local_check_box.value,
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.baseColor,
                            onChanged: controller.person_alive_status.value
                                ? (bool? value) {
                                    controller.non_local_check_box.value =
                                        value ?? false;
                                  }
                                : null,
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Obx(() => CommonInputField(
                            wrapper: controller.non_local_address,
                            hintText: "Address",
                            isEnabled: controller.non_local_check_box.value,
                            onChanged: (text) {
                              controller.non_local_check_box_text_feild.value =
                                  text;
                            },
                          )),
                      Obx(() => CheckboxListTile(
                            title: const Text("Influencer"),
                            value: controller.influencer_check_box.value,
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.baseColor,
                            onChanged: controller.person_alive_status.value
                                ? (bool? value) {
                                    controller.influencer_check_box.value =
                                        value ?? false;
                                  }
                                : null,
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Obx(() => CommonInputField(
                            wrapper: controller.influencer,
                            hintText: "Address",
                            isEnabled: controller.influencer_check_box.value,
                            onChanged: (text) {
                              controller.influencer_check_box_text_feild.value =
                                  text;
                            },
                          )),
                      Obx(() => CheckboxListTile(
                            title: const Text("Dissident"),
                            value: controller.dissident_check_box.value,
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.baseColor,
                            onChanged: controller.person_alive_status.value
                                ? (bool? value) {
                                    controller.dissident_check_box.value =
                                        value ?? false;
                                  }
                                : null,
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Obx(() => CommonInputField(
                            wrapper: controller.dissident,
                            hintText: "Information Given By Person",
                            isEnabled: controller.dissident_check_box.value,
                            onChanged: (text) {
                              controller
                                  .dissident_check_box_information_given_by_person_text_feild
                                  .value = text;
                            },
                          )),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => CommonInputField(
                            wrapper: controller.dissident_comments,
                            hintText: "Comments",
                            isEnabled: controller.dissident_check_box.value,
                            onChanged: (text) {
                              controller.dissident_check_box_comments_text_feild
                                  .value = text;
                            },
                          )),
                      Obx(() => CheckboxListTile(
                            title: const Text("Interested To Join Party"),
                            value: controller
                                .interested_to_join_party_check_box.value,
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.baseColor,
                            onChanged: controller.person_alive_status.value
                                ? (bool? value) {
                                    controller
                                        .interested_to_join_party_check_box
                                        .value = value ?? false;
                                  }
                                : null,
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Obx(() => CommonInputField(
                            wrapper: controller.interested_to_join_party,
                            hintText: "Information Given By Person",
                            isEnabled: controller
                                .interested_to_join_party_check_box.value,
                            onChanged: (text) {
                              controller
                                  .interested_to_join_party_check_box_information_given_by_person_text_feild
                                  .value = text;
                            },
                          )),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => CommonInputField(
                            wrapper:
                                controller.interested_to_join_party_comments,
                            hintText: "Comments",
                            isEnabled: controller
                                .interested_to_join_party_check_box.value,
                            onChanged: (text) {
                              controller
                                  .interested_to_join_party_check_box_comments_text_feild
                                  .value = text;
                            },
                          )),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => CheckboxListTile(
                            title: const Text("Physically Challenged"),
                            value: controller.physically_challenged.value,
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.baseColor,
                            onChanged: controller.person_alive_status.value
                                ? (bool? value) {
                                    controller.physically_challenged.value =
                                        value ?? false;
                                  }
                                : null,
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Obx(() => CheckboxListTile(
                            title: const Text("Deleted"),
                            value: controller.deleted.value,
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.baseColor,
                            onChanged: controller.person_alive_status.value
                                ? (bool? value) {
                                    controller.deleted.value = value ?? false;
                                  }
                                : null,
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Obx(() => CheckboxListTile(
                            title: const Text("Duplicate"),
                            value: controller.duplicate.value,
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.baseColor,
                            onChanged: controller.person_alive_status.value
                                ? (bool? value) {
                                    controller.duplicate.value = value ?? false;
                                  }
                                : null,
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      Obx(() => CheckboxListTile(
                            title: const Text("Is Voted"),
                            value: controller.isvoted.value,
                            checkColor: AppColors.whiteColor,
                            activeColor: AppColors.baseColor,
                            onChanged: controller.person_alive_status.value
                                ? (bool? value) {
                                    controller.isvoted.value = value ?? false;
                                  }
                                : null,
                            controlAffinity: ListTileControlAffinity.leading,
                          )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Habitations"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => controller.person_alive_status.value
                          ? ListSelector(
                              onTap: (Habitationnames) {
                                controller.habitation_names.controller.text =
                                    Habitationnames;
                              },
                              title: "Habitations",
                              data: const [
                                "habitation",
                                "Habitation2",
                                "Habitation3"
                              ],
                              child: CommonInputField(
                                wrapper: controller.habitation_names,
                                hintText: "Select",
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                isEnabled: controller.person_alive_status.value,
                              ))
                          : CommonInputField(
                              wrapper: controller.habitation_names,
                              hintText: "Select",
                              isEnabled: false,
                            )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Schemes"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      Obx(() => controller.person_alive_status.value
                          ? ListSelector(
                              onTap: (Schemenames) {
                                controller.scheme_names.controller.text =
                                    Schemenames;
                              },
                              title: "Schemes",
                              data: const [
                                " YSR Rice Card",
                                "YSR Jagananna Vidya Deevena Scheme",
                                "YSR Arogya Asara Scheme",
                              ],
                              child: CommonInputField(
                                wrapper: controller.scheme_names,
                                hintText: "Select",
                                suffixIcon:
                                    const Icon(Icons.keyboard_arrow_down),
                                isEnabled: true,
                              ),
                            )
                          : CommonInputField(
                              wrapper: controller.scheme_names,
                              hintText: "Select",
                              isEnabled: false,
                            )),
                    ],
                  ).paddingSymmetric(horizontal: Dimens.paddingX3)))
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: CommonFilledButton(
              radius: Dimens.radiusX2,
              text: AppStrings.update,
              onTap: () {},
            ),
          ),
          SizedBox(width: Dimens.gapX1),
          Expanded(
            child: CommonFilledButton(
              radius: Dimens.radiusX2,
              text: AppStrings.reset,
              onTap: () {
                controller.Reset_Page();
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

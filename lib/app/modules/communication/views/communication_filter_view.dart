import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import '../../../../widgets/common/common_button.dart';
import '../../../../widgets/common/common_communication_widget.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../data/values/strings.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../controllers/communication_filter_view_controller.dart';

class CommunicationFilterView extends StatelessWidget {
  CommunicationFilterViewController controller = Get.find();

  CommunicationFilterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        drawer: HeaderDrawer(),
        appBar: CustomAppBar(),
        body: Column(children: [
          Container(
            height: Dimens.screenHeightX10,
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 4),
                      color: Colors.black38,
                      blurRadius: 4)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.COMMUNICATION_SEARCH_VIEW);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                const Padding(
                    padding: EdgeInsets.only(left: Dimens.gapX6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Communication Search",
                          style: AppStyles.tsSecondaryRegular700,
                        ),
                        Text(
                          "For  Search Results",
                          style: AppStyles.tsBlackMedium16,
                        ),
                        Text(
                          "Filters for included data",
                          style: AppStyles.tsBlackMedium16,
                        )
                      ],
                    )),
              ],
            ),
          ),
          Flexible(
              child: SingleChildScrollView(
                  child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.paddingX3),
              child: Column(
                children: [
                  // Obx(() => CustomCheckbox(
                  //     label: "Caste",
                  //     value: controller.casteCheck.value,
                  //     onChanged: (value) {
                  //       controller.casteCheck.value =
                  //           !controller.casteCheck.value;
                  //     })),
                  CommonInputField(wrapper: controller.casteWrapper,hintText: "Caste",),
                  Obx(() => CustomCheckbox(
                      label: "Contact Number",
                      value: controller.contactCheck.value,
                      onChanged: (value) {
                        controller.contactCheck.value =
                            !controller.contactCheck.value;
                      })),
                  Obx(() => CustomCheckbox(
                      label: "Non Local Address",
                      value: controller.nonLocalAddress.value,
                      onChanged: (value) {
                        controller.nonLocalAddress.value =
                            !controller.nonLocalAddress.value;
                      })),
                  Obx(() => CustomCheckbox(
                      label: "Dissident",
                      value: controller.dissident.value,
                      onChanged: (value) {
                        controller.dissident.value =
                            !controller.dissident.value;
                      })),
                  Obx(() => CustomCheckbox(
                      label: "Interested to join party",
                      value: controller.interestedToJoinParty.value,
                      onChanged: (value) {
                        controller.interestedToJoinParty.value =
                            !controller.interestedToJoinParty.value;
                      })),
                  Obx(() => CustomCheckbox(
                      label: "Physically Challenged",
                      value: controller.physicallyChallenged.value,
                      onChanged: (value) {
                        controller.physicallyChallenged.value =
                            !controller.physicallyChallenged.value;
                      })),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Obx(
                    () => CommunicationDropDownWidget(
                      Value: controller.profession.value,
                      onChanged: (value) {
                        controller.profession.value =
                            !controller.profession.value;
                      },
                      wrapper: controller.professionWrapper,
                      hintText: "Profession",
                      onTap: (profession) {
                        controller.professionWrapper.controller.text =
                            profession;
                      },
                      title: 'Profession',
                      data: const [
                        "Political Designation",
                        "Non Political Designation"
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Obx(
                    () => CommunicationDropDownWidget(
                        Value: controller.partyInclination.value,
                        onChanged: (value) {
                          controller.partyInclination.value =
                              !controller.partyInclination.value;
                        },
                        wrapper: controller.partyWrapper,
                        hintText: "Party Inclination",
                        onTap: (partyInclination) {
                          controller.partyWrapper.controller.text =
                              partyInclination;
                        },
                        title: 'Party Inclination',
                        data: controller.partyNamesList.value),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Obx(
                    () => CommunicationDropDownWidget(
                      Value: controller.contactMode.value,
                      onChanged: (value) {
                        controller.contactMode.value =
                            !controller.contactMode.value;
                      },
                      wrapper: controller.contactModeWrapper,
                      hintText: "Contact Mode",
                      onTap: (contactMode) {
                        controller.contactModeWrapper.controller.text =
                            contactMode;
                      },
                      title: 'Contact Mode',
                      data: const ["Personal Contacted", "Team Contacted"],
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Obx(
                    () => CommunicationDropDownWidget(
                        Value: controller.habitations.value,
                        onChanged: (value) {
                          controller.habitations.value =
                              !controller.habitations.value;
                        },
                        wrapper: controller.habitationWrapper,
                        hintText: "Habitations",
                        onTap: (habitations) {
                          controller.habitationWrapper.controller.text =
                              habitations;
                        },
                        title: 'Habitations',
                        data: controller.habitationNamesList.value),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Obx(
                    () => CommunicationDropDownWidget(
                        Value: controller.schemes.value,
                        onChanged: (value) {
                          controller.schemes.value = !controller.schemes.value;
                        },
                        wrapper: controller.schemesWrapper,
                        hintText: "Schemes",
                        onTap: (schemes) {
                          controller.schemesWrapper.controller.text = schemes;
                        },
                        title: 'Schemes',
                        data: controller.schemeNamesList.value),
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.ageCheck.value,
                          onChanged: (value) {
                            controller.ageCheck.value =
                                !controller.ageCheck.value;
                          })),
                      const SizedBox(
                        width: Dimens.gapX1,
                      ),
                      Row(
                        children: [
                          const Text("Age"),
                          const SizedBox(
                            width: Dimens.gapX1,
                          ),
                          StreamBuilder<RangeValues>(
                            stream: controller.sliderStream,
                            initialData: RangeValues(
                              controller.lowerAge.value,
                              controller.upperAge.value,
                            ),
                            builder: (context, snapshot) {
                              return RangeSlider(
                                values: snapshot.data!,
                                min: 18,
                                max: 100,
                                divisions: 82,
                                labels: RangeLabels(
                                  snapshot.data!.start.round().toString(),
                                  snapshot.data!.end.round().toString(),
                                ),
                                onChanged: (values) {
                                  controller.updateAgeRange(values);
                                  controller.updateSliderStream(values);
                                },
                                activeColor: AppColors.baseColor,
                                inactiveColor: AppColors.greyColor,
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Padding(
                      padding: EdgeInsets.only(
                          right: Dimens.gapX10, bottom: Dimens.gapX1),
                      child: Text("filters selected")),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.gapX3,
                          right: Dimens.gapX3,
                          bottom: Dimens.gapX2),
                      child: CommonFilledButton(
                        onTap: () {
                          controller.getCommunicationFilter();
                        },
                        text: "Apply & Create Communication",
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                        left: Dimens.gapX3,
                        right: Dimens.gapX3,
                      ),
                      child: CommonFilledButton(
                        onTap: () {
                          controller.onReset();
                        },
                        text: AppStrings.reset,
                      ))
                ],
              ),
            )
          ])))
        ]));
  }
}

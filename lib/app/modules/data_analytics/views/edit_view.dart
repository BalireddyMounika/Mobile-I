import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/modules/data_analytics/views/voter_slips_view.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_edit_campaign_bar.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/common_text.dart';
import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';
import 'package:prasada_political_portfolio/widgets/custom_widget.dart';
import '../../../data/values/dimens.dart';
import '../../../data/values/images.dart';
import '../../../data/values/strings.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../controllers/edit_view_controller.dart';

class EditView extends StatelessWidget {
  Edit_view_controller controller = Get.put(Edit_view_controller());
  EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: HeaderDrawer(),
        body: Column(
          children: [
            const CommonCompainEditView(),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.gapX2),
                  child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(Voter_slips());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                border:
                                    Border.all(color: AppColors.secondaryColor),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                    height: Dimens.gapX3,
                                    image: AssetImage(AppImages.card)),
                                SizedBox(
                                  width: Dimens.gapX1,
                                ),
                                Text(
                                  "View Card",
                                  style: AppStyles.tsSecondaryRegular18,
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      CommonEditFeild(
                        text: "Voter Id",
                        Value: "APA0902604",
                      ),
                      CommonEditFeild(
                        text: "Name",
                        Value: "A.P.Naidu",
                      ),
                      CommonEditFeild(
                        text: "Guardian",
                        Value: "A.P.Naidu (Brother)",
                      ),
                      CommonEditFeild(
                        text: "H.No",
                        Value: "9-26-4",
                      ),
                      CommonEditFeild(text: "Age", Value: "40"),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: Dimens.gapX2,
                        ),
                        child: CommonText(text: "Gender"),
                      ),
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
                                controller
                                    .genderfunction(controller.gender.value);
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
                          controller.state.controller.text = state;
                        },
                        title: "State",
                        data: const ["AP"],
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
                      ListSelector(
                        onTap: (district) async {
                          controller.district.controller.text = district;
                        },
                        title: "District",
                        data: const ["Anakapalli"],
                        child: CommonInputField(
                          wrapper: controller.district,
                          hintText: "Please Select District",
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Constituency"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      ListSelector(
                        onTap: (constituency) async {
                          controller.constituency.controller.text =
                              constituency;
                        },
                        title: "Constituency",
                        data: const ["Madugula", "Anakapalle"],
                        child: CommonInputField(
                          wrapper: controller.constituency,
                          hintText: "Please Select Constituency",
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Polling Station Number"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      ListSelector(
                        onTap: (pollingStationNumber) async {
                          controller.polling_station_number.controller.text =
                              pollingStationNumber;
                        },
                        title: "Polling Station Number",
                        data: const ["193", "194", "195"],
                        child: CommonInputField(
                          wrapper: controller.polling_station_number,
                          hintText: "Please Select Polling Station Number",
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
                      ListSelector(
                        onTap: (pollingStationName) async {
                          controller.polling_station_name.controller.text =
                              pollingStationName;
                        },
                        title: "Polling Station Name",
                        data: const [
                          "A.Veeranarayanam",
                          "Aarli",
                          "adavi agraharam",
                        ],
                        child: CommonInputField(
                          wrapper: controller.polling_station_name,
                          hintText: "Please Select Polling Station Name",
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
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
                          controller.polling_station_location.controller.text =
                              pollingStationLocation;
                        },
                        title: "Polling Station Location",
                        data: const [
                          "Aided U P School, North room Peddirajupeta10",
                          "Aided U P School, North room Peddirajupeta11",
                          "Aided U P School, North room Peddirajupeta12",
                        ],
                        child: CommonInputField(
                          wrapper: controller.polling_station_location,
                          hintText: "Please Select Polling Station Location",
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.gapX2,
                      ),
                      const CommonText(text: "Section Number & Name"),
                      const SizedBox(
                        height: Dimens.gapX1,
                      ),
                      ListSelector(
                        onTap: (sectionNumberName) async {
                          controller.section_number_name.controller.text =
                              sectionNumberName;
                        },
                        title: "Section Number & Name",
                        data: const [
                          " 3-BC COLONY",
                          " 1-YATHAPETA",
                          " 2-GOLLIPETA"
                        ],
                        child: CommonInputField(
                          wrapper: controller.section_number_name,
                          hintText: "Please Select Section Number & Name",
                          suffixIcon: const Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.gapX2,
                              right: Dimens.gapX2,
                              top: Dimens.gapX3),
                          child: CommonFilledButton(
                            text: 'Update',
                            onTap: () {},
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.gapX2,
                              right: Dimens.gapX2,
                              top: Dimens.gapX2),
                          child: CommonFilledButton(
                            text: 'Reset',
                            onTap: () {
                              controller.ResetPage();
                            },
                            color: AppColors.snackbarColor,
                            isFilled: false,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/strings.dart';
import 'package:prasada_political_portfolio/widgets/bottom_navigation.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_styles.dart';
import '../controllers/data_analytics_search_controller.dart';

class DataAnalyticSearchScreen extends StatelessWidget {
  DataAnalyticSearchScreen({Key? key}) : super(key: key);
  Data_analytic_search_screen_controller controller =
      Get.put(Data_analytic_search_screen_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HeaderDrawer(),
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomBottomNavigation(),
      bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.paddingX3, vertical: Dimens.paddingX3),
          child: CommonFilledButton(
            onTap: () {
              Get.toNamed(Routes.DATA_ANALYTICS_VOTER_VIEW);
            },
            text: AppStrings.search,
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.gapX3),
            child: Column(
              children: [
                const Text(AppStrings.dataanalytics,
                    style: AppStyles.tsSecondaryRegular700),
                const SizedBox(
                  height: Dimens.gapX3,
                ),
                ListSelector(
                  onTap: (constituency) async {
                    controller.constituency.controller.text = constituency;
                  },
                  title: AppStrings.constituency,
                  data: const ["Madugula", "Anakapalle"],
                  child: CommonInputField(
                    wrapper: controller.constituency,
                    hintText: "Constitutency Selection *",
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                const SizedBox(
                  height: Dimens.gapX2,
                ),
                ListSelector(
                  onTap: (v) {
                    controller.pollingstationnames.controller.text = v;
                  },
                  title: AppStrings.pollingstationname,
                  data: const [
                    "A.Veeranarayanam",
                    "Aarli",
                    "adavi agraharam",
                  ],
                  child: CommonInputField(
                    wrapper: controller.pollingstationnames,
                    hintText: "Polling Station Selection *",
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                const SizedBox(
                  height: Dimens.gapX2,
                ),
                CommonInputField(
                  wrapper: controller.name,
                  hintText: "Name (min 3 Letters)",
                ),
                const SizedBox(
                  height: Dimens.gapX2,
                ),
                ListSelector(
                  onTap: (sectionnameandnumber) {
                    controller.sectionnameandnumber.controller.text =
                        sectionnameandnumber;
                  },
                  title: AppStrings.sectionnameandnumber,
                  data: const [" 3-BC COLONY", " 1-YATHAPETA", " 2-GOLLIPETA"],
                  child: CommonInputField(
                    wrapper: controller.sectionnameandnumber,
                    hintText: "Section Name and Number",
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                const SizedBox(
                  height: Dimens.gapX2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.man,
                      size: Dimens.gapX3,
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
                          controller.genderfunction(controller.gender.value);
                        },
                      ),
                    ),
                    const Text(AppStrings.female),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

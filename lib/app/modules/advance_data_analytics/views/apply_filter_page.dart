import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';

import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../controllers/apply_filter_page_controller.dart';

class FilterView extends StatelessWidget {
  final filter_view_controller controller = Get.put(filter_view_controller());

  FilterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Filters for excluded data'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.only(
                    left: Dimens.gapX3,
                    right: Dimens.gapX3,
                    bottom: Dimens.gapX3),
                child: Text(
                    "Excluding Filter(caste, contact number and party inclination)")),
            Row(
              children: [
                Obx(() => Checkbox(
                    value: controller.select_all_check_box.value,
                    onChanged: (value) {
                      controller.select_all_on_change(value);
                    })),
                const Text("Select All"),
              ],
            ),
            Row(
              children: [
                Obx(() => Checkbox(
                    value: controller.caste_check_box.value,
                    onChanged: (value) {
                      controller.on_check_box_button(controller.caste_check_box
                          .value = !controller.caste_check_box.value);
                    })),
                const Text("Caste"),
              ],
            ),
            Row(
              children: [
                Obx(() => Checkbox(
                    value: controller.contact_check_box.value,
                    onChanged: (value) {
                      controller.on_check_box_button(controller
                          .contact_check_box
                          .value = !controller.contact_check_box.value);
                    })),
                const Text("Contact Number"),
              ],
            ),
            Row(
              children: [
                Obx(() => Checkbox(
                    value: controller.party_check_box.value,
                    onChanged: (value) {
                      controller.on_check_box_button(controller.party_check_box
                          .value = !controller.party_check_box.value);
                    })),
                const Text("Party inclanation"),
              ],
            ),
            SizedBox(height: Dimens.gapX7),
            Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.gapX4,
                  right: Dimens.gapX4,
                ),
                child: CommonFilledButton(
                  text: 'Apply Filter',
                  onTap: () {
                    Get.toNamed(Routes.FILTER_VOTER_VIEW);
                  },
                ))
          ],
        ),
      ),
    );
  }
}

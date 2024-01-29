import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/views/advance_data_analytic_voter_view.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/controllers/quick_insight_controller.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';

class QuickInsightFilter extends StatelessWidget {
  QuickInsightController controller = Get.find<QuickInsightController>();
  QuickInsightFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: Dimens.screenHeight - 100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('filter Included data', style: AppStyles.tsBlackMedium16),
                InkWell(
                    onTap: () => Get.back(),
                    child: Icon(Icons.clear, color: AppColors.baseColor))
              ],
            ),
            SizedBox(height: Dimens.gapX2),
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                      controller.filterList.length,
                      (index) => CustomCheckBox(
                        onChecked: () => controller.onCheckedFilter(
                            name: controller.filterList[index]),
                        name: controller.filterList[index],
                        isActive: controller.selectedFilter.contains(
                          controller.filterList[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimens.gapX1),
            Row(
              children: [
                Text('Select Age'),
                Obx(
                  () => Expanded(
                    child: RangeSlider(
                      activeColor: AppColors.baseColor,
                      values: controller.ageRangeValues.value,
                      max: 100,
                      min: 18,
                      divisions: 100,
                      labels: RangeLabels(
                        controller.ageRangeValues.value.start
                            .round()
                            .toString(),
                        controller.ageRangeValues.value.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        controller.ageRangeValues.value = values;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => Align(
                alignment: Alignment.centerRight,
                child: Text(
                    'Age : (${controller.ageRangeValues.value.start.toInt()}-${controller.ageRangeValues.value.end.toInt()})'),
              ),
            ),
            SizedBox(height: Dimens.gapX2),
            CommonFilledButton(
              radius: Dimens.radiusX3,
              text: 'Apply Filter',
              onTap: () => controller.getFilteredInsightData(
                callback: (success) {
                  if (success) {
                    Get.back();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

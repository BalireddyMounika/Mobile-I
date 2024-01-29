import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/controllers/quick_insight_controller.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/widgets/filter_included_data.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/widgets/quick_insight_voter_card.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/helper/validators.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_container.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

class InsightsSearchResultView extends GetView<QuickInsightController> {
  const InsightsSearchResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.resetSearch();
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            SizedBox(height: Dimens.gapX1),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    AppUtils.getBottomSheet(
                        ignoreSafeAres: true, children: [QuickInsightFilter()]);
                  },
                  child: CommonContainer(
                      radius: Dimens.radiusX2,
                      isBorder: true,
                      child: Row(
                        children: [
                          Icon(Icons.filter_list_alt),
                          Text('filter (1)'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ).paddingSymmetric(
                          horizontal: Dimens.paddingX3,
                          vertical: Dimens.paddingX2)),
                ),
                Spacer(),
                CommonFilledButton(
                    height: 42,
                    radius: Dimens.radiusX2,
                    text: 'Save',
                    onTap: () {
                      AppUtils.getBottomSheet(children: [
                        Form(
                          key: controller.saveInsightFormKey,
                          child: Column(
                            children: [
                              Text(
                                  'Result(${controller.voterDataList.length.toString()})',
                                  style: AppStyles.tsBlackMedium16),
                              SizedBox(height: Dimens.gapX3),
                              CommonInputField(
                                  validator: mandatoryValidator,
                                  hintText: 'Description',
                                  wrapper: controller.description),
                              SizedBox(height: Dimens.gapX2),
                              CommonInputField(
                                  validator: mandatoryValidator,
                                  hintText: 'Quick Insights Name',
                                  wrapper: controller.nameOfYourQuickInsights),
                              SizedBox(height: Dimens.gapX3),
                              CommonFilledButton(
                                  text: 'Save',
                                  onTap: () {
                                    if (controller
                                        .saveInsightFormKey.currentState!
                                        .validate()) {
                                      controller.saveSearchQuickInsights();
                                    }
                                  }),
                            ],
                          ),
                        )
                      ]);
                    })
              ],
            ).paddingSymmetric(horizontal: Dimens.paddingX3),
            SizedBox(height: Dimens.gapX2),
            Flexible(
              child: Obx(
                () => controller.voterDataList.isNotEmpty
                    ? ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.voterDataList.length,
                        itemBuilder: (ctx, idx) => QuickInsightVoterCard(
                                voterResponse: controller.voterDataList[idx])
                            .paddingSymmetric(
                                horizontal: Dimens.paddingX3,
                                vertical: Dimens.paddingX2),
                      )
                    : const Center(
                        child: Text('No data found'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

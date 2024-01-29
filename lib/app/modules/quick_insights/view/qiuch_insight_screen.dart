import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/controllers/quick_insight_controller.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/widgets/insight_card.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

class QuickInsightsView extends GetView<QuickInsightController> {
  const QuickInsightsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      body: Column(
        children: [
          SizedBox(height: Dimens.gapX1),
          Text('Quick Insight', style: AppStyles.tsBlackBold16),
          SizedBox(height: Dimens.gapX1),
          Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${controller.selectedQuickInsightList.length}/${controller.quickInsightList.length}',
                  style: AppStyles.tsBlackSemiBold14,
                ),
                Spacer(),
                if (controller.selectedQuickInsightList.length > 1)
                  Icon(Icons.ios_share).paddingOnly(left: Dimens.gapX2),
                if (controller.selectedQuickInsightList.length == 1)
                  InkWell(
                      onTap: () => controller.onEditInsights(
                          data: controller.selectedQuickInsightList.first),
                      child: Icon(Icons.note_alt_outlined)
                          .paddingOnly(left: Dimens.gapX2)),
                if (controller.selectedQuickInsightList.length == 1)
                  Icon(Icons.chat).paddingOnly(left: Dimens.gapX2),
                if (controller.selectedQuickInsightList.length == 1)
                  Icon(Icons.more_vert).paddingOnly(left: Dimens.gapX2),
              ],
            ).paddingSymmetric(horizontal: Dimens.paddingX3),
          ),
          SizedBox(height: Dimens.gapX1),
          Flexible(
            child: Obx(
              () => ListView.builder(
                controller: controller.scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: controller.quickInsightList.length,
                itemBuilder: (ctx, idx) => InsightCard(
                  onUpdate: () => controller.onUpdate(
                      controller.quickInsightList[idx], idx),
                  onSelect: () =>
                      controller.onSelect(controller.quickInsightList[idx]),
                  onLongPress: () =>
                      controller.onLongPress(controller.quickInsightList[idx]),
                  isSelected: controller.selectedQuickInsightList
                      .contains(controller.quickInsightList[idx]),
                  insightData: controller.quickInsightList[idx],
                ).paddingSymmetric(
                    horizontal: Dimens.paddingX3, vertical: Dimens.paddingX2),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CommonFilledButton(
        radius: Dimens.radiusX2,
        text: 'Create Quick Insights',
        onTap: () => Get.toNamed(Routes.ADD_INSIGHT),
      ).paddingSymmetric(
          horizontal: Dimens.paddingX2, vertical: Dimens.paddingX2),
    );
  }
}

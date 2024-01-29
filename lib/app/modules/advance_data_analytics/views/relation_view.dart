import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/response/VoterResponse.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/controllers/advance_data_analytics_search_controller.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/widgets/voder_card.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';

class RelationVoterView extends GetView<AdvanceDataAnalyticSearchController> {
  const RelationVoterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.familyVoterDataList.length,
          itemBuilder: (ctx, idx) =>
              VoterCard(voterResponse: controller.familyVoterDataList[idx])
                  .paddingSymmetric(
                      horizontal: Dimens.paddingX3,
                      vertical: Dimens.paddingX2)),
    );
  }
}

class votercard extends StatelessWidget {
  const votercard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.CAMPAIGN_VIEW);
            },
            child: Padding(
                padding: const EdgeInsets.only(
                    left: Dimens.paddingX3,
                    right: Dimens.paddingX3,
                    top: Dimens.paddingX4),
                child: VoterCard(
                  voterResponse: VoterResponse(),
                )),
          );
        });
  }
}

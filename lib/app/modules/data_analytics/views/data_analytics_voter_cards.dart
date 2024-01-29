import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';

class data_analytics_voter_view extends StatelessWidget {
  const data_analytics_voter_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HeaderDrawer(),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Container(
              height: Dimens.imageScaleX8,
              decoration: BoxDecoration(
                  color: AppColors.snackbarColor,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0.0, 0.0),
                        color: AppColors.greyColor,
                        blurRadius: 4)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: Dimens.gapX1),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.DATA_ANALYTICS_SEARCH);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                    const SizedBox(
                      width: Dimens.gapX3,
                    ),
                    const Expanded(
                      child: Text(
                        "Constituency / Polling Station / \n Gender / Name",
                        style: AppStyles.tsBlackRegular14,
                      ),
                    )
                  ],
                ),
              )),
          const Expanded(child: votercard())
        ],
      ),
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
        itemCount: 3,
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
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.whiteColor),
                      borderRadius: BorderRadius.circular(Dimens.gapX1)),
                  child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Dimens.gapX1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(Dimens.gapX1))),
                          ),
                          const Text(
                            "APA0902604",
                            style: AppStyles.tsBaseRegular14,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.person),
                              SizedBox(
                                width: Dimens.gapX1,
                              ),
                              Text(
                                "A.P.Naidu",
                                style: AppStyles.tsBlackRegular16,
                              )
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.family_restroom_outlined),
                              SizedBox(
                                width: Dimens.gapX1,
                              ),
                              Text(
                                "A.P.Naidu (Brother)",
                                style: AppStyles.tsBlackRegular12,
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.cake),
                              SizedBox(
                                width: Dimens.gapX1,
                              ),
                              Text(
                                "40",
                                style: AppStyles.tsBlackRegular12,
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.home_filled),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "9-26-4",
                                style: AppStyles.tsBlackRegular12,
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.male),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Male",
                                style: AppStyles.tsBlackRegular12,
                              ),
                            ],
                          ),
                        ],
                      )),
                )),
          );
        });
  }
}

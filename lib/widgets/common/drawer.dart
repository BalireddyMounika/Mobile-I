import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/data/values/images.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';
import 'package:prasada_political_portfolio/widgets/custom_widget.dart';

class HeaderDrawer extends StatelessWidget {
  HeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isVisible = false;
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(
                    decoration:
                        const BoxDecoration(color: AppColors.secondaryColor),
                    child: Image.asset(AppImages.drawer)),
                ListTile(
                  leading: const Icon(Icons.dashboard,
                      color: AppColors.secondaryColor),
                  title: const Text('Dashboard',
                      style: AppStyles.tsSecondaryRegular18),
                  onTap: () {
                    Get.toNamed(Routes.HOME);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.auto_graph,
                      color: AppColors.secondaryColor),
                  title: const Text('Advanced Data Analytics',
                      style: AppStyles.tsSecondaryRegular18),
                  onTap: () {
                    Get.toNamed(Routes.ADVANCE_DATA_ANALYTICS_SEARCH);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.lightbulb,
                      color: AppColors.secondaryColor),
                  title: const Text('Quick Insigths',
                      style: AppStyles.tsSecondaryRegular18),
                  onTap: () {
                    Get.toNamed(Routes.QUICK_INSIGHTS);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.volunteer_activism_sharp,
                      color: AppColors.secondaryColor),
                  title: const Text('Polling Day',
                      style: AppStyles.tsSecondaryRegular18),
                  onTap: () {
                    Get.toNamed(Routes.POLLING_DAY_PAGE);
                  },
                ),
                Visibility(
                  visible: isVisible,
                  child: Column(
                    children: [
                      ListTile(
                          leading: const Icon(
                            Icons.person,
                            color: AppColors.secondaryColor,
                          ),
                          title: const Text('Profile',
                              style: AppStyles.tsSecondaryRegular18),
                          onTap: () => {Get.toNamed(Routes.PROFILE_ABOUT_YOU)}),
                      ListTile(
                        leading: const Icon(Icons.analytics,
                            color: AppColors.secondaryColor),
                        title: const Text('Data Analytics',
                            style: AppStyles.tsSecondaryRegular18),
                        onTap: () {
                          Get.toNamed(Routes.DATA_ANALYTICS_SEARCH);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.campaign,
                            color: AppColors.secondaryColor),
                        title: const Text('Communication',
                            style: AppStyles.tsSecondaryRegular18),
                        onTap: () {
                          Get.toNamed(Routes.COMMUNICATION);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.campaign,
                            color: AppColors.secondaryColor),
                        title: const Text('Data Ops',
                            style: AppStyles.tsSecondaryRegular18),
                        onTap: () {
                          // Get.toNamed(Routes.common_page);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.event,
                            color: AppColors.secondaryColor),
                        title: const Text('Events',
                            style: AppStyles.tsSecondaryRegular18),
                        onTap: () {
                          Get.toNamed(Routes.EVENT_FIRST_PAGE);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings,
                            color: AppColors.secondaryColor),
                        title: const Text('Settings',
                            style: AppStyles.tsSecondaryRegular18),
                        onTap: () {
                          // Get.toNamed(Routes.common_page);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(Dimens.paddingX5),
              child: CustomButton(
                  buttonName: "LOG OUT",
                  onTap: () {
                    AppStorage.clear();
                    Get.offAndToNamed(Routes.LOGIN);
                  }))
        ],
      ),
    );
  }
}

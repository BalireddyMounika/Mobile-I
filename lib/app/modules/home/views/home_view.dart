import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/images.dart';
import 'package:prasada_political_portfolio/app/modules/home/controllers/home_controller.dart';
import 'package:prasada_political_portfolio/app/modules/home/views/chart_bort_screen.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/widgets/bottom_navigation.dart';
import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
import 'package:prasada_political_portfolio/widgets/common/metabase_view.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HeaderDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.YellowColor,
          onPressed: () {
            Get.to(() => const BotScreen());
          },
          child: const Image(
            image: AssetImage(AppImages.chatbot),
          ),
        ),
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomNavigation(),
        body: controller.image.isEmpty
            ? const Center(
                child: Text("Network Error"),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    MetabaseWebView(
                      index: 0,
                    ),
                    MetabaseWebView(
                      index: 1,
                    ),
                    MetabaseWebView(
                      index: 2,
                    ),
                    MetabaseWebView(
                      index: 3,
                    ),
                    MetabaseWebView(
                      index: 4,
                    ),
                    MetabaseWebView(
                      index: 5,
                    ),
                    MetabaseWebView(
                      index: 6,
                    ),
                    MetabaseWebView(
                      index: 7,
                    ),
                    MetabaseWebView(
                      index: 8,
                    ),
                    MetabaseWebView(
                      index: 9,
                    ),
                    MetabaseWebView(
                      index: 10,
                    ),
                    MetabaseWebView(
                      index: 11,
                    ),
                    MetabaseWebView(
                      index: 12,
                    ),
                    MetabaseWebView(
                      index: 13,
                    ),
                    MetabaseWebView(
                      index: 14,
                    ),
                  ],
                ),
              ));
  }
}

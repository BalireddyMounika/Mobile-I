import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/common/common_button.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../controllers/sent_view_controller.dart';

class SentView extends StatelessWidget {
  SentViewController controller = Get.put(SentViewController());
  SentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: HeaderDrawer(),
        body: Padding(
            padding: const EdgeInsets.only(
                left: Dimens.gapX3, right: Dimens.gapX3, top: Dimens.gapX3),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(children: [
                    const Text(
                      "Created On : ",
                    ),
                    Obx(() => Text(
                        '${controller.currentDate.value} | ${controller.currentTime.value} | ${controller.currentDay.value}')),
                  ]),
                  Row(children: [
                    const Text(
                      "Sent On : ",
                    ),
                    Obx(() => Text(
                        '${controller.currentDate.value} | ${controller.currentTime.value} | ${controller.currentDay.value}')),
                  ]),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Text(
                    "Sent",
                    style: AppStyles.tsBlackSemiBold16,
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Communication for",
                        style: AppStyles.tsBlackRegular16,
                      )),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Container(
                    height: Dimens.screenHeightX10,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Madugula // Aarli 230 // Gollipeta // Male //"),
                        Text("Caste : AC // Scheme 1 // 18-25 years")
                      ],
                    )),
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Communication name",
                        style: AppStyles.tsBlackRegular16,
                      )),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: Dimens.gapX1),
                    alignment: Alignment.centerLeft,
                    height: Dimens.screenHeightX16,
                    width: Dimens.screenWidthX12,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text("My name is communication"),
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style: AppStyles.tsBlackRegular16,
                      )),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: Dimens.gapX1),
                    alignment: Alignment.centerLeft,
                    height: Dimens.screenHeightX16,
                    width: Dimens.screenWidthX12,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text("I write communication description here"),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Type",
                        style: AppStyles.tsBlackRegular16,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: Dimens.gapX2),
                        alignment: Alignment.centerLeft,
                        height: Dimens.screenHeightX16,
                        width: Dimens.screenWidthXThird,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Text("SMS"),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: Dimens.gapX2),
                        alignment: Alignment.centerLeft,
                        height: Dimens.screenHeightX16,
                        width: Dimens.screenWidthXThird,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyColor),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Text("Email"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Text Subject",
                        style: AppStyles.tsBlackRegular16,
                      )),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: Dimens.gapX1),
                    alignment: Alignment.centerLeft,
                    height: Dimens.screenHeightX16,
                    width: Dimens.screenWidthX12,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text("I am the subject"),
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Message",
                        style: AppStyles.tsBlackRegular16,
                      )),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: Dimens.gapX1),
                    alignment: Alignment.centerLeft,
                    height: Dimens.screenHeightX16,
                    width: Dimens.screenWidthX12,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text("I write message here"),
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email Subject",
                        style: AppStyles.tsBlackRegular16,
                      )),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: Dimens.gapX1),
                    alignment: Alignment.centerLeft,
                    height: Dimens.screenHeightX16,
                    width: Dimens.screenWidthX12,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text("I am the subject"),
                  ),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Message",
                        style: AppStyles.tsBlackRegular16,
                      )),
                  const SizedBox(
                    height: Dimens.gapX1,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: Dimens.gapX1),
                    alignment: Alignment.centerLeft,
                    height: Dimens.screenHeightX16,
                    width: Dimens.screenWidthX12,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greyColor),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Text("I write message here"),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: Dimens.gapX3,
                          right: Dimens.gapX3,
                          top: Dimens.gapX3,
                          bottom: Dimens.gapX2),
                      child: CommonFilledButton(
                          text: "Back to Communication",
                          onTap: () {
                            Get.toNamed(Routes.COMMUNICATION);
                          }))
                ],
              ),
            )));
  }
}

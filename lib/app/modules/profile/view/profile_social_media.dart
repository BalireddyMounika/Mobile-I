import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/custom_profile_stepper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../utils/snackbar/snackbar.dart';
import '../../../../widgets/common/common_button.dart';
import '../../../../widgets/common/common_reset_button.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../controller/profile_controller.dart';
import '../widgets/common_list_view.dart';
import '../widgets/common_social_media_container.dart';

class ProfileSocialMedia extends GetView<ProfileController> {
  ProfileSocialMedia({Key? key}) : super(key: key);

  @override
  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CustomProfileStepper(),
          const Text("Profile/Social Media", style: AppStyles.tsBlackBold22),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Social Media", style: AppStyles.tsBlackRegular18),
              SizedBox(
                width: 6,
              ),
              Text("(4 out of 5)", style: AppStyles.tsBlackRegular14)
            ],
          ),
          const SizedBox(
            height: Dimens.scaleX2,
          ),
          CommonSocialMediaContainer(
            titleText: 'Telegram',
            linkController: controller.telegramLinkTextController,
            descController: controller.telegramDescTextController,
            onTapAddItems: () {
              if (controller
                  .telegramLinkTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Link Text');
              } else if (controller
                  .telegramDescTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Description Text');
              } else {
                controller.onAddTelegramLinkItems(
                    controller.telegramLinkTextController.controller.text);
                controller.onAddTelegramDescItems(
                    controller.telegramDescTextController.controller.text);
                controller.telegramLinkTextController.controller.clear();
                controller.telegramDescTextController.controller.clear();
              }
            },
          ),
          Obx(() => controller.TelegramLinkList.isEmpty
              ? const Text("")
              : CommonListViewSocialMedia(
                  count: controller.TelegramLinkList.length,
                  textLinkList: controller.TelegramLinkList,
                  textDescList: controller.TelegramDescList,
                )),
          const SizedBox(
            height: Dimens.scaleX2,
          ),
          CommonSocialMediaContainer(
            titleText: 'FaceBook',
            linkController: controller.facebookLinkTextController,
            descController: controller.facebookDescTextController,
            onTapAddItems: () {
              if (controller
                  .facebookLinkTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Link Text');
              } else if (controller
                  .facebookDescTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Description Text');
              } else {
                controller.onAddFacebookLinkItems(
                    controller.facebookLinkTextController.controller.text);
                controller.onAddFacebookDescItems(
                    controller.facebookDescTextController.controller.text);
                controller.facebookLinkTextController.controller.clear();
                controller.facebookDescTextController.controller.clear();
              }
            },
          ),
          Obx(() => controller.FacebookLinkList.isEmpty
              ? const Text("")
              : CommonListViewSocialMedia(
                  count: controller.FacebookLinkList.length,
                  textLinkList: controller.FacebookLinkList,
                  textDescList: controller.FacebookDescList,
                )),
          const SizedBox(
            height: Dimens.scaleX2,
          ),
          CommonSocialMediaContainer(
            titleText: 'Twitter',
            linkController: controller.twitterLinkTextController,
            descController: controller.twitterDescTextController,
            onTapAddItems: () {
              if (controller
                  .twitterLinkTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Link Text');
              } else if (controller
                  .twitterDescTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Description Text');
              } else {
                controller.onAddTwitterLinkItems(
                    controller.twitterLinkTextController.controller.text);
                controller.onAddTwitterDescItems(
                    controller.twitterDescTextController.controller.text);
                controller.twitterLinkTextController.controller.clear();
                controller.twitterDescTextController.controller.clear();
              }
            },
          ),
          Obx(() => controller.TwitterLinkList.isEmpty
              ? const Text("")
              : CommonListViewSocialMedia(
                  count: controller.TwitterLinkList.length,
                  textLinkList: controller.TwitterLinkList,
                  textDescList: controller.TwitterDescList,
                )),
          const SizedBox(
            height: Dimens.scaleX2,
          ),
          CommonSocialMediaContainer(
            titleText: 'Whatsapp',
            linkController: controller.whatsappLinkTextController,
            descController: controller.whatsappDescTextController,
            onTapAddItems: () {
              if (controller
                  .whatsappLinkTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Link Text');
              } else if (controller
                  .whatsappDescTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Description Text');
              } else {
                controller.onAddWhatsappLinkItems(
                    controller.whatsappLinkTextController.controller.text);
                controller.onAddWhatsappDescItems(
                    controller.whatsappDescTextController.controller.text);
                controller.whatsappLinkTextController.controller.clear();
                controller.whatsappDescTextController.controller.clear();
              }
            },
          ),
          Obx(() => controller.WhatsappLinkList.isEmpty
              ? const Text("")
              : CommonListViewSocialMedia(
                  count: controller.WhatsappLinkList.length,
                  textLinkList: controller.WhatsappLinkList,
                  textDescList: controller.WhatsappDescList,
                )),
          const SizedBox(
            height: Dimens.scaleX2,
          ),
          CommonSocialMediaContainer(
            titleText: 'LinkedIn',
            linkController: controller.linkedInLinkTextController,
            descController: controller.linkedInDescTextController,
            onTapAddItems: () {
              if (controller
                  .linkedInLinkTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Link Text');
              } else if (controller
                  .linkedInDescTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Description Text');
              } else {
                controller.onAddLinkedInLinkItems(
                    controller.linkedInLinkTextController.controller.text);
                controller.onAddLinkedInDescItems(
                    controller.linkedInDescTextController.controller.text);
                controller.linkedInLinkTextController.controller.clear();
                controller.linkedInDescTextController.controller.clear();
              }
            },
          ),
          Obx(() => controller.LinkedInLinkList.isEmpty
              ? const Text("")
              : CommonListViewSocialMedia(
                  count: controller.LinkedInLinkList.length,
                  textLinkList: controller.LinkedInLinkList,
                  textDescList: controller.LinkedInDescList,
                )),
          const SizedBox(
            height: Dimens.scaleX2,
          ),
          CommonSocialMediaContainer(
            titleText: 'Youtube',
            linkController: controller.youtubeLinkTextController,
            descController: controller.youtubeDescTextController,
            onTapAddItems: () {
              if (controller
                  .youtubeLinkTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Link Text');
              } else if (controller
                  .youtubeDescTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Description Text');
              } else {
                controller.onAddYoutubeLinkItems(
                    controller.youtubeLinkTextController.controller.text);
                controller.onAddYoutubeDescItems(
                    controller.youtubeDescTextController.controller.text);
                controller.youtubeLinkTextController.controller.clear();
                controller.youtubeDescTextController.controller.clear();
              }
            },
          ),
          Obx(() => controller.YoutubeLinkList.isEmpty
              ? const Text("")
              : CommonListViewSocialMedia(
                  count: controller.YoutubeLinkList.length,
                  textLinkList: controller.YoutubeLinkList,
                  textDescList: controller.YoutubeDescList,
                )),
          const SizedBox(
            height: Dimens.scaleX2,
          ),
          CommonSocialMediaContainer(
            titleText: 'Instagram',
            linkController: controller.InstagramLinkTextController,
            descController: controller.InstagramDescTextController,
            onTapAddItems: () {
              if (controller
                  .InstagramLinkTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Link Text');
              } else if (controller
                  .InstagramDescTextController.controller.text.isEmpty) {
                Error_message("Error", 'Enter Description Text');
              } else {
                controller.onAddInstagramLinkItems(
                    controller.InstagramLinkTextController.controller.text);
                controller.onAddInstagramDescItems(
                    controller.InstagramDescTextController.controller.text);
                controller.InstagramLinkTextController.controller.clear();
                controller.InstagramDescTextController.controller.clear();
              }
            },
          ),
          Obx(() => controller.InstagramLinkList.isEmpty
              ? const Text("")
              : CommonListViewSocialMedia(
                  count: controller.InstagramLinkList.length,
                  textLinkList: controller.InstagramLinkList,
                  textDescList: controller.InstagramDescList,
                )),
          const SizedBox(
            height: Dimens.scaleX4,
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.imageScaleX3),
            child: CommonFilledButton(
                text: "Save & Next",
                onTap: () {
                  Get.toNamed(Routes.PROFILE_EC_STATUS);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.imageScaleX3),
            child: CommonResetButton(text:"Reset", onTap:(){
              controller.onResetSocialPage();
            }),
          )
        ]),
      ),
    );
  }
}


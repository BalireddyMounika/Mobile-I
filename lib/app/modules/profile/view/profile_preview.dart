
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/profile/controller/profile_controller.dart';
import 'package:prasada_political_portfolio/app/modules/profile/widgets/common_link_listview.dart';
import 'package:prasada_political_portfolio/app/modules/profile/widgets/common_profile_preview_text.dart';
import 'package:prasada_political_portfolio/app/modules/profile/widgets/profile_carousel_slider.dart';
import 'package:prasada_political_portfolio/app/modules/profile/widgets/profile_circular_image.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../widgets/profile_preview_fields.dart';


class ProfilePreviewPage extends StatelessWidget {
  const ProfilePreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();
    return Scaffold(
        appBar: AppBar(title: const Text("Preview"),),
        body: SingleChildScrollView(
            child: Column(
                children: [
                 ProfileCarouselSlider(),
                  CommonProfilePreviewText(text:controller.slogan.controller.text, style:AppStyles.tsBlackBold20, align:TextAlign.center,),
                  CommonProfilePreviewText(text:controller.partyAffiliationText.controller.text, style:AppStyles.tsBlackBold14, align:TextAlign.center),
                  Row(
                    children: [
                      ProfileCircularImageContainer(imagePath:controller.selectedProfilePicImagepath.value, height:Dimens.gapX10, width: Dimens.gapX10),
                      ProfileCircularImageContainer(imagePath:controller.selectedPartyLogoImagepath.value, height:Dimens.imageScaleX9, width: Dimens.imageScaleX9),
                      ProfileCircularImageContainer(imagePath:controller.selectedSymbolImagepath.value, height:Dimens.imageScaleX9, width: Dimens.imageScaleX9),
                    ],
                  ),
                  CommonProfilePreviewText(text:controller.candidateBrief.controller.text, style:AppStyles.tsBlackMedium14, align:TextAlign.center),

                  ProfilePreviewText(MainText:"Name: ", SideText:controller.name.controller.text),
                  ProfilePreviewText(MainText:"Age: ", SideText:controller.age.controller.text),
                  ProfilePreviewText(MainText:"Date of Birth: ", SideText:controller.dateOfBirth.controller.text),
                  ProfilePreviewText(MainText:"Place of birth: ", SideText:controller.placeOfBirth.controller.text),
                  ProfilePreviewText(MainText:"Gender: ", SideText:controller.genderValue.value),
                  ProfilePreviewText(MainText:"Email id: ", SideText:controller.emailId.controller.text),
                  ProfilePreviewText(MainText:"Address: ", SideText:controller.address.controller.text),
                  const SizedBox(height: Dimens.scaleX2,),
                  const CommonProfilePreviewText(text:"Manifesto", style:AppStyles.tsBlackBold20, align:TextAlign.center),
                  ProfileCircularImageContainer(imagePath:controller.selectedPartyManifesto.value, height:Dimens.screenHeightX45, width: Dimens.screenWidthX14),
                  const SizedBox(height:Dimens.scaleX2,),
                  const CommonProfilePreviewText(text:"Video URL's", style:AppStyles.tsBlackBold20, align:TextAlign.center),
                  Obx(() => controller.youTubeTextList.isEmpty
                              ? const Text("Enter Your Video Url's")
                              :CommonProfileLinkListView(count: controller.youTubeTextList.length, textLinkList: controller.youTubeTextList),
                              ),
                  const SizedBox(height:Dimens.scaleX2,),
                  const CommonProfilePreviewText(text:"Activists", style:AppStyles.tsBlackBold20, align:TextAlign.center),
                  Obx(() => controller.activistsTextList.isEmpty
                      ? const Text("Enter Your Activists")
                      :CommonProfileTextListView(count: controller.activistsTextList.length, textLinkList: controller.activistsTextList),
                  ),
                  const SizedBox(height:Dimens.scaleX2,),
                  const CommonProfilePreviewText(text:"Achievements", style:AppStyles.tsBlackBold20, align:TextAlign.center),
                  Obx(() => controller.achievementsTextList.isEmpty
                      ? const Text("Enter Your Achievements")
                      :CommonProfileTextListView(count: controller.achievementsTextList.length, textLinkList: controller.achievementsTextList),
                  ),
                  const SizedBox(height:Dimens.scaleX2,),
                  const CommonProfilePreviewText(text:"Priorities", style:AppStyles.tsBlackBold20, align:TextAlign.center),
                  Obx(() => controller.prioritiesTextList.isEmpty
                      ? const Text("Enter Your Priorities")
                      :CommonProfileTextListView(count: controller.prioritiesTextList.length, textLinkList: controller.prioritiesTextList),
                  ),

                  const CommonProfilePreviewText(text:'Political History', style:AppStyles.tsBlackBold20, align:TextAlign.center),
                  Obx(() => controller.HistoryListItems.isEmpty ? const Text("Enter your Political History"):
                  Column(
                    children:List.generate(controller.HistoryListItems.length, (index){
                      return ListTile(
                        title:Center(child: Text("${controller.HistoryPartyNames[index]}, (${controller.HistoryPersonDesignation[index]})",style:AppStyles.tsBlackMedium14,)),
                        subtitle:Center(child: Text("${controller.HistoryFromDate[index]} to ${controller.HistoryToDate[index]}",style:AppStyles.tsBlackRegular12,)),
                      );
                    },growable: true),
                  )
                  ),

                  const CommonProfilePreviewText(text:"Join us for Support", style:AppStyles.tsBlackBold20, align:TextAlign.center),
                  const SizedBox(height:Dimens.scaleX2,),

                  Obx(() => controller.TelegramDescList.isEmpty
                      ? const Text("Enter Your Telegram Links")
                      :CommonPreviewMediaListView(count:controller.TelegramDescList.length, textLinkList: controller.TelegramLinkList, textDescList: controller.TelegramDescList,
                      icon:const FaIcon(FontAwesomeIcons.telegram))
                  ),
                      const SizedBox(height: Dimens.scaleX2,),
                  Obx(() => controller.FacebookDescList.isEmpty
                      ? const Text("Enter Your Facebook Links")
                      :CommonPreviewMediaListView(count:controller.FacebookDescList.length, textLinkList: controller.FacebookLinkList, textDescList: controller.FacebookDescList,
                      icon:const FaIcon(FontAwesomeIcons.facebook))
                  ),
                  const SizedBox(height: Dimens.scaleX2,),
                  Obx(() => controller.TwitterDescList.isEmpty
                      ? const Text("Enter Your Twitter Links")
                      :CommonPreviewMediaListView(count:controller.TwitterDescList.length, textLinkList: controller.TwitterLinkList, textDescList: controller.TwitterDescList,
                      icon:const FaIcon(FontAwesomeIcons.twitter))
                  ),
                  const SizedBox(height: Dimens.scaleX2,),

                  Obx(() => controller.WhatsappDescList.isEmpty
                      ? const Text("Enter Your Whatsapp Links")
                      :CommonPreviewMediaListView(count:controller.WhatsappDescList.length, textLinkList: controller.WhatsappLinkList, textDescList: controller.WhatsappDescList,
                      icon:const FaIcon(FontAwesomeIcons.whatsapp))
                  ),
                  const SizedBox(height: Dimens.scaleX2,),

                  Obx(() => controller.LinkedInDescList.isEmpty
                      ? const Text("Enter Your Linkedin Links")
                      :CommonPreviewMediaListView(count:controller.LinkedInDescList.length, textLinkList: controller.LinkedInLinkList, textDescList: controller.LinkedInDescList,
                      icon:const FaIcon(FontAwesomeIcons.linkedin))
                  ),
                  const SizedBox(height: Dimens.scaleX2,),

                  Obx(() => controller.YoutubeDescList.isEmpty
                      ? const Text("Enter Your Youtube Links")
                      :CommonPreviewMediaListView(count:controller.YoutubeDescList.length, textLinkList: controller.YoutubeLinkList, textDescList: controller.YoutubeDescList,
                      icon:const FaIcon(FontAwesomeIcons.youtube))
                  ),
                  const SizedBox(height: Dimens.scaleX2,),

                  Obx(() => controller.InstagramDescList.isEmpty
                      ? const Text("Enter Your Instagram Links")
                      :CommonPreviewMediaListView(count:controller.InstagramDescList.length, textLinkList: controller.InstagramLinkList, textDescList: controller.InstagramDescList,
                      icon:const FaIcon(FontAwesomeIcons.instagram))
                  ),
                  const SizedBox(height: Dimens.scaleX2,),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.imageScaleX2),
                    child: CommonFilledButton(text:"Publish Profile", onTap:(){}),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimens.imageScaleX2),
                    child: CommonFilledButton(text: "Edit Profile", onTap:(){
                      Get.toNamed(Routes.PROFILE_ABOUT_YOU);
                    }),
                  )
                    ],
                  ),
            )
    );
  }
}





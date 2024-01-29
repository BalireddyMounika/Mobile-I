import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/data/values/images.dart';
import 'package:prasada_political_portfolio/app/modules/events/controllers/event_controller.dart';
import 'package:prasada_political_portfolio/app/modules/events/widgets/common_event_title_text.dart';
import 'package:prasada_political_portfolio/app/modules/events/widgets/event_preview_images_list.dart';
import 'package:prasada_political_portfolio/app/modules/events/widgets/event_preview_items_list.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';

import '../widgets/event_preview_carousel.dart';

class EventPreviewPage extends StatelessWidget {
  EventPreviewPage({Key? key}) : super(key: key);
  EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Event Preview Page"),
      ),
      body:Container(
          height: Dimens.screenHeight,
          color: AppColors.snackbarColor,
          child: SingleChildScrollView(
            child: Column(
                      children: [
                        const SizedBox(height:Dimens.scaleX2,),
                        const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image(
                                image: AssetImage(AppImages.prasad),
                                width:Dimens.imageScaleX12,
                              ),
                              Text("Prasad Rao Pyla",
                                  style:AppStyles.tsBlackSemiBold24)
                            ],
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: Dimens.paddingX5, top: Dimens.paddingX3),
                              child: CommonFilledButton(onTap: () {}, text: 'Join Us',),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: Dimens.paddingX5),
                              child: Row(
                                children: [
                                  IconButton(onPressed: () {}, icon: const Icon(Icons.share),),
                                  const Text(
                                    "Share",
                                    style: AppStyles.tsSecondaryColorRegular14,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: Dimens.paddingX3),
                          child: Text(
                            controller.titleTextController.controller.text,
                            style: AppStyles.tsSecondaryRegular700,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        EventPreviewListItems(text:controller.eventLocationAddress.controller.text, icon:const Icon(Icons.location_on), overflow:TextOverflow.clip),
                        EventPreviewListItems(text:controller.selectedEventStartDate.value.toString(), icon:const Icon(Icons.calendar_month), overflow:TextOverflow.clip),
                        EventPreviewListItems(text:"${controller.getFormattedStartTime()} to ${controller.getFormattedScheduleTime()}", icon:const Icon(Icons.watch_later_outlined), overflow:TextOverflow.clip),
                        EventPreviewListItems(text:controller.eventCategoryDropDownText.controller.text, icon:const Icon(Icons.list_alt_outlined), overflow:TextOverflow.clip),
                        EventPreviewListItems(text:controller.virtualLinkTextController.controller.text, icon:const Icon(Icons.link), overflow:TextOverflow.clip),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.paddingX5,
                              right: Dimens.paddingX5,
                              top: Dimens.paddingX3),
                          child: CommonFilledButton(onTap: () {}, text: 'I want to participate',),
                        ),
                        EventPreviewCarousel(),
                        const CommonEventTitle(text:"Description"),
                        CommonEventText(text:controller.descriptionTextController.controller.text),

                        Container(
                          width: Dimens.screenWidth,
                          height:Dimens.screenHeightX34,
                          color: AppColors.whiteColor,
                          margin: const EdgeInsets.only(
                              left: Dimens.marginX5,
                              right: Dimens.marginX5,
                              top: Dimens.marginX3),
                          child: Column(
                            children: [
                              EventPreviewListItems(text:controller.eventLocationAddress.controller.text, icon:const Icon(Icons.location_on), overflow:TextOverflow.clip),
                              EventPreviewListItems(text:controller.selectedEventStartDate.value.toString(), icon:const Icon(Icons.calendar_month), overflow:TextOverflow.clip),
                              EventPreviewListItems(text:"${controller.getFormattedStartTime()} to ${controller.getFormattedScheduleTime()}", icon:const Icon(Icons.watch_later_outlined), overflow:TextOverflow.clip),
                              EventPreviewListItems(text:controller.eventCategoryDropDownText.controller.text, icon:const Icon(Icons.list_alt_outlined), overflow:TextOverflow.clip),
                              EventPreviewListItems(text:controller.virtualLinkTextController.controller.text, icon:const Icon(Icons.link), overflow:TextOverflow.clip),
                            ],
                          ),
                        ),
                        const CommonEventTitle(text:"Instructions"),
                        CommonEventText(text:controller.eventInstructionTextController.controller.text),
                        const CommonEventTitle(text:"Event Host"),
                        CommonEventText(text:controller.eventHostTextController.controller.text),
                        const CommonEventTitle(text: "Floor Plan"),

                        Container(
                          width: Dimens.imageScaleX24,
                          height: Dimens.imageScaleX24,
                          margin: const EdgeInsets.only(left: Dimens.scaleX1),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondaryColor),
                            image: DecorationImage(
                              image: FileImage(
                                  File(controller.selectedEventFloorImage.value)),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const CommonEventTitle(text: "Guests"),
                        EventPreviewImagesList(count: controller.guestsImagesList.length, textLinkList: controller.guestsNamesList, imagesList: controller.guestsImagesList),
                        const CommonEventTitle(text: "Speaker"),
                        EventPreviewImagesList(count: controller.guestSpeakerImageList.length, textLinkList: controller.guestSpeakerNamesList, imagesList: controller.guestSpeakerImageList),
                        const CommonEventTitle(text: "Organizer"),
                        EventPreviewImagesList(count: controller.eventOrganizerImagesList.length, textLinkList: controller.eventOrganizerNamesList, imagesList: controller.eventOrganizerImagesList),
                        const CommonEventTitle(text: "Sponsors"),
                        EventPreviewImagesList(count: controller.eventSponsorsImagesList.length, textLinkList: controller.eventSponsorsNamesList, imagesList: controller.eventSponsorsImagesList),
                        const CommonEventTitle(text: "Contacts"),
                        Obx(() =>
                        controller.contactLists.isEmpty
                            ? const Text("")
                            :Column(
                          children:List.generate(controller.contactLists.length, (index){
                            return Container(
                                margin: const EdgeInsets.only(
                                    left: Dimens.paddingX4,
                                    right: Dimens.paddingX4),
                                width: Dimens.screenWidthX14,
                                child: ListTile(
                                  title: Text(
                                      controller.contactLists[index]),
                                )
                            );
                          }),
                        )
                        ),
                        EventPreviewListItems(text:controller.eventLocationAddress.controller.text, icon:const Icon(Icons.location_on), overflow:TextOverflow.clip),
                        EventPreviewListItems(text:controller.selectedEventStartDate.value.toString(), icon:const Icon(Icons.calendar_month), overflow:TextOverflow.clip),
                        EventPreviewListItems(text:"${controller.getFormattedStartTime()} to ${controller.getFormattedScheduleTime()}", icon:const Icon(Icons.watch_later_outlined), overflow:TextOverflow.clip),
                        EventPreviewListItems(text:controller.eventCategoryDropDownText.controller.text, icon:const Icon(Icons.list_alt_outlined), overflow:TextOverflow.clip),
                        EventPreviewListItems(text:controller.virtualLinkTextController.controller.text, icon:const Icon(Icons.link), overflow:TextOverflow.clip),

                      ]),
          )
              ),
    );
  }
}


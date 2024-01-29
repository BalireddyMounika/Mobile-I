import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prasada_political_portfolio/app/modules/events/controllers/event_controller.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/events/widgets/common_event_image_listview.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/custom_event_stepper.dart';
import '../../../../utils/snackbar/snackbar.dart';
import '../../../../widgets/common/common_image_container.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../widgets/common_event_title_text.dart';

class EventPlanPage extends StatelessWidget {
  const EventPlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      body: Column(
        children: [
          Container(
            child:Column(
              children: [
                Row(
                  children: [
                    InkWell(child: const Icon(Icons.arrow_back_ios,size:Dimens.imageScaleX3,),onTap:(){Get.back();},),
                    const Align(alignment:Alignment.center,child:Text("Events",style:AppStyles.tsSecondaryRegular700,)),
                  ],),
                CustomEventStepper(),
              ],
            ),
          ),
          Expanded(child: EventPlanData())
        ],
      ),
    );
  }
}

class EventPlanData extends StatelessWidget {
  EventPlanData({Key? key}) : super(key: key);
  EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, index) {
          return Column(
            children: [
             const CommonEventTitle(text:"Guests"),
              Obx(() => controller.selectedGuestImage.value.isEmpty ? ImageContainer(imagePath: controller.selectedGuestImage.value, onTapOpenGallery:(){
                controller.getGuestImage(ImageSource.gallery);
                Get.back();
              }, onTapOpenCamera:(){
                controller.getGuestImage(ImageSource.camera);
                Get.back();
              }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX24,) : ImageOpenContainer(openedImagePath:controller.selectedGuestImage.value, onTapRemoveImage:(){
                controller.removeGuestImage();
              }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX24,)),
              Padding(
                padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
                child: CommonInputField(wrapper:controller.guestNameTextController,hintText: 'Name',),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(right:Dimens.imageScaleX3),
                    width: Dimens.imageScaleX3,
                    height: Dimens.imageScaleX3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.secondaryColor)),
                    child: const Icon(
                      Icons.add,
                      size: Dimens.imageScaleX2,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onTap: () {
                    controller.guestNameTextController.controller.text.isEmpty ? Error_message('Error','Enter Valid Name or Image'):
                    controller.onAddGuestsInfoList(
                        controller.guestNameTextController.controller.text,
                        controller.selectedGuestImage.value);
                    controller.removeGuestImage();
                    controller.guestNameTextController.controller.clear();
                  },
                ),
              ),
              Obx(() => controller.guestsImagesList.isEmpty ? Text("") :
              EventImageListView(count:controller.guestsImagesList.length, textLinkList:controller.guestsNamesList, imagesList: controller.guestsImagesList,icon:Icon(Icons.cancel),)
              ),
              const CommonEventTitle(text:'Event Speaker'),
              Obx(() =>controller.selectedGuestSpeakerImage.value.isEmpty ? ImageContainer(imagePath: controller.selectedGuestSpeakerImage.value, height: Dimens.imageScaleX24, width: Dimens.imageScaleX24, onTapOpenGallery:(){
                controller.getGuestSpeakerImage(ImageSource.gallery);
                Get.back();
              }, onTapOpenCamera:(){
                controller.getGuestSpeakerImage(ImageSource.camera);
                Get.back();
              }) : ImageOpenContainer(height:Dimens.imageScaleX24, width: Dimens.imageScaleX24, openedImagePath: controller.selectedGuestSpeakerImage.value, onTapRemoveImage:(){
                controller.removeGuestSpeakerImage();
              })),
              Padding(
                padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
                child: CommonInputField(wrapper:controller.guestSpeakerTextController,hintText:'Name',),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(right:Dimens.imageScaleX3),
                    width: Dimens.imageScaleX3,
                    height: Dimens.imageScaleX3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.secondaryColor)),
                    child: const Icon(
                      Icons.add,
                      size: Dimens.imageScaleX2,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onTap: () {
                    controller.guestSpeakerTextController.controller.text.isEmpty ? Error_message('Error','Enter Valid Name or Image'):
                    controller.onAddGuestsSpeakerList(
                        controller.guestSpeakerTextController.controller.text,
                        controller.selectedGuestSpeakerImage.value);
                    controller.removeGuestSpeakerImage();
                    controller.guestSpeakerTextController.controller.clear();
                  },
                ),
              ),
              Obx(() => controller.guestSpeakerImageList.isEmpty ? Text(""):
                  EventImageListView(count:controller.guestSpeakerImageList.length, textLinkList:controller.guestSpeakerNamesList, imagesList:controller.guestSpeakerImageList,icon:Icon(Icons.cancel),)
              ),

              const CommonEventTitle(text: "Event Floor Plan"),
              Obx(() => controller.selectedEventFloorImage.value.isEmpty ? ImageContainer(imagePath: controller.selectedEventFloorImage.value, height: Dimens.imageScaleX24, width: Dimens.imageScaleX24, onTapOpenGallery:(){
                controller.getEventFloorImage(ImageSource.gallery);
                Get.back();
              }, onTapOpenCamera:(){
                controller.getEventFloorImage(ImageSource.camera);
                Get.back();
              }) : ImageOpenContainer(height:Dimens.imageScaleX24, width: Dimens.imageScaleX24, openedImagePath: controller.selectedEventFloorImage.value, onTapRemoveImage:(){
                controller.removeEventFloorImage();
              })),
              const CommonEventTitle(text:'Event Host'),
              Padding(
                padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
                child: CommonInputField(wrapper: controller.eventHostTextController,hintText:'Name',),
              ),
              const CommonEventTitle(text:'Expected Members'),
              Padding(
                padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
                child: CommonInputField(wrapper: controller.eventExpectedTextController,hintText:'Type here',),
              ),
              const CommonEventTitle(text:'Instruction'),
              Padding(
                padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
                child: CommonInputField(wrapper: controller.eventInstructionTextController,hintText:'Type here',maxLine: 3,),
              ),
              const CommonEventTitle(text:'Tags'),
              Padding(
                padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
                child: CommonInputField(wrapper: controller.eventTagsTextController,hintText:'Type here to add tags',),
              ),
              const CommonEventTitle(text: 'Event Organizer'),
              Obx(() => controller.selectedOrganizerImage.value.isEmpty ? ImageContainer(imagePath:controller.selectedOrganizerImage.value, height: Dimens.imageScaleX24, width: Dimens.imageScaleX24, onTapOpenGallery:(){
                controller.getOrganizerImage(ImageSource.gallery);
                Get.back();
              }, onTapOpenCamera:(){
                controller.getOrganizerImage(ImageSource.camera);
                Get.back();
              }) : ImageOpenContainer(height:Dimens.imageScaleX24, width: Dimens.imageScaleX24, openedImagePath:controller.selectedOrganizerImage.value, onTapRemoveImage:(){
                controller.removeOrganizerImage();
              })),
              Padding(
                padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
                child: CommonInputField(wrapper: controller.eventOrganizerTextController,hintText:'Name',),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(right:Dimens.imageScaleX3),
                    width: Dimens.imageScaleX3,
                    height: Dimens.imageScaleX3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.secondaryColor)),
                    child: const Icon(
                      Icons.add,
                      size: Dimens.imageScaleX2,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onTap: () {
                    controller.eventOrganizerTextController.controller.text.isEmpty ? Error_message('Error','Enter Valid Name or Image'):
                    controller.onAddOrganizerList(
                        controller.eventOrganizerTextController.controller.text,
                        controller.selectedOrganizerImage.value);
                    controller.removeOrganizerImage();
                    controller.eventOrganizerTextController.controller.clear();
                  },
                ),
              ),
              Obx(() => controller.eventOrganizerImagesList.isEmpty ? Text("") :
                  EventImageListView(count:controller.eventOrganizerImagesList.length, textLinkList:controller.eventOrganizerNamesList, imagesList:controller.eventOrganizerImagesList,icon:Icon(Icons.cancel),)
              ),

              const CommonEventTitle(text: 'Event Sponsor'),
              Obx(() => controller.selectedSponsorImage.value.isEmpty ? ImageContainer(imagePath:controller.selectedSponsorImage.value, height: Dimens.imageScaleX24, width: Dimens.imageScaleX24, onTapOpenGallery:(){
                controller.getSponsorImage(ImageSource.gallery);
                Get.back();
              }, onTapOpenCamera:(){
                controller.getSponsorImage(ImageSource.camera);
                Get.back();
              }): ImageOpenContainer(height:Dimens.imageScaleX24, width: Dimens.imageScaleX24, openedImagePath: controller.selectedSponsorImage.value, onTapRemoveImage:(){
                controller.removeSponsorImage();
              })),
             Padding(
               padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
               child: CommonInputField(wrapper:controller.eventSponsorNameTextController,hintText:'Sponsor Name',),
             ),
              Padding(
                padding: const EdgeInsets.only(left:Dimens.imageScaleX3,right:Dimens.imageScaleX3,top:Dimens.imageScaleX3),
                child: CommonInputField(wrapper:controller.eventSponsorTypeTextController,hintText:'Type of Sponsor',),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(right:Dimens.imageScaleX3),
                    width: Dimens.imageScaleX3,
                    height: Dimens.imageScaleX3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondaryColor,
                        border: Border.all(color: AppColors.secondaryColor)),
                    child: const Icon(
                      Icons.add,
                      size:Dimens.imageScaleX2,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onTap: () {
                    controller.eventSponsorNameTextController.controller.text.isEmpty ? Error_message('Error','Enter Valid Name or Image'):
                    controller.onAddSponsorsList(
                        controller.eventSponsorNameTextController.controller.text,
                        controller.eventSponsorTypeTextController.controller.text,
                        controller.selectedSponsorImage.value);
                    controller.removeSponsorImage();
                    controller.eventSponsorNameTextController.controller.clear();
                    controller.eventSponsorTypeTextController.controller.clear();
                  },
                ),
              ),
              Obx(() => Column(
                children:List.generate(controller.eventSponsorsImagesList.length, (index){
                  return Padding(
                    padding: const EdgeInsets.only(top: Dimens.imageScaleX1),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          controller.eventSponsorsImagesList.isEmpty
                              ? const Text("No Image Found")
                              : Container(
                            width: Dimens.imageScaleX9,
                            height: Dimens.imageScaleX9,
                            margin:
                            const EdgeInsets.only(left: Dimens.scaleX1),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.secondaryColor),
                              image: DecorationImage(
                                image: FileImage(File(controller
                                    .eventSponsorsImagesList[index])),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(controller.eventSponsorsNamesList[index]),
                              Text(controller.eventSponsorsTypeList[index]),
                            ],
                          ),
                          InkWell(
                            child: const Icon(Icons.cancel),
                            onTap: () {
                              controller.onRemoveSponsorsList(index);
                            },
                          )
                        ]),
                  );
                }),
              )
              ),

              Padding(
                padding: const EdgeInsets.all(Dimens.imageScaleX2),
                child: CommonFilledButton(text:'Saved Next', onTap:(){
                  controller.onAddEventContainersList();
                  Get.toNamed(Routes.EVENT_FIRST_PAGE);
                }),
              )

            ],
          );
        });
  }
}

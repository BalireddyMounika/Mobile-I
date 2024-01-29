import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/custom_profile_stepper.dart';
import '../../../../utils/snackbar/snackbar.dart';
import '../../../../widgets/common/common_button.dart';
import '../../../../widgets/common/common_input_field.dart';
import '../../../../widgets/common/common_reset_button.dart';
import '../../../../widgets/common/common_small_image_container.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common/list_selector.dart';
import '../../../../widgets/common_appbar.dart';
import '../controller/profile_controller.dart';
import '../widgets/common_list_view.dart';

class ProfileCandidateInfo extends GetView<ProfileController> {
  const ProfileCandidateInfo({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            CustomProfileStepper(),
            const Text("Profile/Candidate Information",
                style:AppStyles.tsBlackBold22
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Candidate Information",
                    style: AppStyles.tsBlackRegular18
                ),
                SizedBox(
                  width:Dimens.scaleX1,
                ),
                Text("(2 out of 5)",
                    style:AppStyles.tsBlackRegular14)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimens.paddingX4, left: Dimens.paddingX3),
              child: Column(
                children: [
                  const Text(
                      "Party Logo",
                      style:AppStyles.tsBlackSemiBold18
                  ),
                  const SizedBox(
                    width: Dimens.scaleX8,
                  ),
                  Obx(() => controller.selectedPartyLogoImagepath.value.isEmpty
                      ? CommonSmallImageContainer(
                      imagePath: controller.selectedPartyLogoImagepath.value,
                      onTapOpenGallery: () {
                        controller.getLogoImage(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getLogoImage(ImageSource.camera);
                        Get.back();
                      })
                      : openedSmallImageContainer(
                      openedImagePath:
                      controller.selectedPartyLogoImagepath.value,
                      onTapRemoveImage: () {
                        controller.removeLogoImage();
                      },)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:Dimens.imageScaleX3, left:Dimens.imageScaleX2),
              child: Column(
                children: [
                  const Text(
                      "Party Symbol",
                      style: AppStyles.tsBlackSemiBold18
                  ),
                  const SizedBox(
                    width: Dimens.scaleX8,
                  ),
                  Obx(() => controller.selectedSymbolImagepath.value.isEmpty
                      ? CommonSmallImageContainer(
                      imagePath: controller.selectedSymbolImagepath.value,
                      onTapOpenGallery: () {
                        controller.getSymbolImage(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getSymbolImage(ImageSource.camera);
                        Get.back();
                      })
                      : openedSmallImageContainer(
                      openedImagePath:
                      controller.selectedSymbolImagepath.value,
                      onTapRemoveImage: () {
                        controller.removeSymbolImage();
                      })),

                ],
              ),
            ),
            ListSelector(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.paddingX4,
                      right: Dimens.paddingX4,
                      top: Dimens.paddingX4,
                      bottom: Dimens.paddingX4),
                  child: CommonInputField(
                    wrapper: controller.partyAffiliationText,
                    hintText: "Party Affiliation",
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
                onTap: (party) async{
                  controller.partyAffiliationText.controller.text = party;
                },
                title: "Party Affiliation",
                data:controller.partyNamesList),
            const SizedBox(
              height: Dimens.gapX1,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: Dimens.gapX3, right: Dimens.gapX3),
              child:
              CommonInputField(wrapper: controller.slogan, hintText: "Slogan"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: Dimens.imageScaleX3),
              child: Column(children: [
                const Text(
                    "Upload Party Files",
                    style: AppStyles.tsBlackSemiBold18
                ),
                Container(
                  width: Dimens.imageScaleX12,
                  height: Dimens.imageScaleX12,
                  margin:const EdgeInsets.only(top:Dimens.imageScaleX3),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.secondaryColor)),
                  child: IconButton(
                      icon: const Icon(Icons.file_upload_outlined),
                      onPressed: () {
                        // controller.pickPartyFile();
                        controller.PartyFileName.value = '';
                        controller.PartyFilePath.value = '';
                      }),
                ),
              ]),
            ),
            Obx(
                  () => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.PartyFileNamesList.length,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(controller.PartyFileNamesList[index]),
                        trailing: InkWell(
                          child: const Icon(Icons.cancel),
                          onTap: () {
                            controller.removeFileNames(index);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: Dimens.gapX1,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: Dimens.gapX3, right: Dimens.gapX3),
              child: CommonInputField(
                  wrapper: controller.activistsTextController,
                  hintText: "Activists"),
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
                  controller.activistsTextController.controller.text.isEmpty
                      ? Error_message("Error", "Enter any Text")
                      : controller.onAddActivistsText(
                      controller.activistsTextController.controller.text);
                  controller.activistsTextController.controller.clear();
                },
              ),
            ),
            Obx(() => controller.activistsTextList.isEmpty
                ? const Text("")
                : CommonListViewCandidateInfo(count:controller.activistsTextList.length, textLinkList:controller.activistsTextList,),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: Dimens.gapX3, right: Dimens.gapX3),
              child: CommonInputField(
                  wrapper: controller.achievementsTextController,
                  hintText: "Achievements"),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsets.only(right: Dimens.imageScaleX3),
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
                  controller.achievementsTextController.controller.text.isEmpty
                      ? Error_message("Error", "Enter any Text")
                      : controller.onAddAchievementsText(
                      controller.achievementsTextController.controller.text);
                  controller.achievementsTextController.controller.clear();
                },
              ),
            ),
            Obx(() => controller.achievementsTextList.isEmpty
                ? const Text("")
                : CommonListViewCandidateInfo(count:controller.achievementsTextList.length, textLinkList:controller.achievementsTextList,),
            ),
            const SizedBox(
              height: Dimens.gapX1,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: Dimens.gapX3, right: Dimens.gapX3),
              child: CommonInputField(
                  wrapper: controller.prioritiesTextController,
                  hintText: "Priorities"),
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
                  controller.prioritiesTextController.controller.text.isEmpty
                      ? Error_message("Error", "Enter any Text")
                      : controller.onAddPrioritiesText(
                      controller.prioritiesTextController.controller.text);
                  controller.prioritiesTextController.controller.clear();
                },
              ),
            ),
            Obx(() => controller.prioritiesTextList.isEmpty
                ? const Text("")
                : CommonListViewCandidateInfo(count:controller.prioritiesTextList.length, textLinkList:controller.prioritiesTextList),
            ),

            Padding(
              padding: const EdgeInsets.only(top:Dimens.imageScaleX3),
              child: Column(children: [
                const Text(
                  "Upload Party Manifesto",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: Dimens.scaleX2,
                      fontWeight: FontWeight.w700),
                ),
                Obx(() => controller.selectedPartyManifesto.value.isEmpty
                    ? CommonSmallImageContainer(
                    imagePath: controller.selectedPartyManifesto.value,
                    onTapOpenGallery: () {
                      controller.getPartyManifestoImage(ImageSource.gallery);
                      Get.back();
                    },
                    onTapOpenCamera: () {
                      controller.getPartyManifestoImage(ImageSource.camera);
                      Get.back();
                    })
                    : openedSmallImageContainer(
                    openedImagePath:
                    controller.selectedPartyManifesto.value,
                    onTapRemoveImage: () {
                      controller.removePartyManifestoImage();
                    })),
              ]),
            ),
            const SizedBox(
              height: Dimens.gapX1,
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: Dimens.gapX3, right: Dimens.gapX3),
              child: CommonInputField(
                  wrapper: controller.videoUrlsTextController,
                  hintText: "Video Url's"),
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
                  controller.videoUrlsTextController.controller.text.isEmpty
                      ? Error_message("Error", "Enter any Text")
                      : controller.onAddYoutubeText(
                      controller.videoUrlsTextController.controller.text);
                  controller.videoUrlsTextController.controller.clear();
                },
              ),
            ),
            Obx(() =>controller.youTubeTextList.isEmpty ? const Text("") :
            CommonListViewSocialMedia(count:controller.youTubeTextList.length, textLinkList:controller.youTubeTextList, textDescList:controller.youTubeTextList,)
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.imageScaleX3),
              child: CommonFilledButton(
                  text: "Save & Next",
                  onTap: () {
                    Get.toNamed(Routes.PROFILE_POLITICAL_HISTORY);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.imageScaleX3),
              child: CommonResetButton(text:"Reset", onTap:(){
                controller.onResetCandidateInfoPage();
              }),
            ),
          ])),
    );
  }
}
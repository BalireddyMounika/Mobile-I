import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/widgets/common/custom_profile_stepper.dart';
import '../../../../widgets/common/common_button.dart';
import '../../../../widgets/common/common_image_container.dart';
import '../../../../widgets/common/common_input_field.dart';
import '../../../../widgets/common/common_reset_button.dart';
import '../../../../widgets/common/common_small_image_container.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_styles.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/profile_controller.dart';

class ProfileAboutYou extends GetView<ProfileController> {
  ProfileAboutYou({Key? key}) : super(key: key);
  @override
  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            CustomProfileStepper(),
            const SizedBox(
              height: Dimens.scaleX1,
            ),
            const Text(
              'Profile/About You',
              style: AppStyles.tsSecondaryRegular700,
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Obx(() => controller.selectedLogo1Imagepath.value.isEmpty
                      ? ImageContainer(
                      imagePath: controller.selectedLogo1Imagepath.value,
                      onTapOpenGallery: () {
                        controller.getLogo1Image(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getLogo1Image(ImageSource.camera);
                        Get.back();
                      }, height:Dimens.imageScaleX24, width: Dimens.imageScaleX20,)
                      : ImageOpenContainer(
                      openedImagePath:
                      controller.selectedLogo1Imagepath.value,
                      onTapRemoveImage: () {
                        controller.removeLogo1Image();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)),
                  Obx(() => controller.selectedLogo2Imagepath.value.isEmpty
                      ? ImageContainer(
                      imagePath: controller.selectedLogo2Imagepath.value,
                      onTapOpenGallery: () {
                        controller.getLogo2Image(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getLogo2Image(ImageSource.camera);
                        Get.back();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)
                      : ImageOpenContainer(
                      openedImagePath:
                      controller.selectedLogo2Imagepath.value,
                      onTapRemoveImage: () {
                        controller.removeLogo2Image();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)),
                  Obx(() => controller.selectedLogo3Imagepath.value.isEmpty
                      ? ImageContainer(
                      imagePath: controller.selectedLogo3Imagepath.value,
                      onTapOpenGallery: () {
                        controller.getLogo3Image(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getLogo3Image(ImageSource.camera);
                        Get.back();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)
                      : ImageOpenContainer(
                      openedImagePath:
                      controller.selectedLogo3Imagepath.value,
                      onTapRemoveImage: () {
                        controller.removeLogo3Image();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)),
                  Obx(() => controller.selectedLogo4Imagepath.value.isEmpty
                      ? ImageContainer(
                      imagePath: controller.selectedLogo4Imagepath.value,
                      onTapOpenGallery: () {
                        controller.getLogo4Image(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getLogo4Image(ImageSource.camera);
                        Get.back();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)
                      : ImageOpenContainer(
                      openedImagePath:
                      controller.selectedLogo4Imagepath.value,
                      onTapRemoveImage: () {
                        controller.removeLogo4Image();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)),
                  Obx(() => controller.selectedLogo5Imagepath.value.isEmpty
                      ? ImageContainer(
                      imagePath: controller.selectedLogo5Imagepath.value,
                      onTapOpenGallery: () {
                        controller.getLogo5Image(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getLogo5Image(ImageSource.camera);
                        Get.back();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)
                      : ImageOpenContainer(
                      openedImagePath:
                      controller.selectedLogo5Imagepath.value,
                      onTapRemoveImage: () {
                        controller.removeLogo5Image();
                      }, height: Dimens.imageScaleX24, width: Dimens.imageScaleX20,)),
                ],
              ),
            ),
            const SizedBox(height: Dimens.scaleX1),
            Row(children: [
              const Padding(
                padding: EdgeInsets.all(Dimens.imageScaleX4),
                child: Text('profile picture',
                    style: AppStyles.tsSecondaryRegular700),
              ),
              Obx(() => controller.selectedProfilePicImagepath.value.isEmpty
                  ? CommonSmallImageContainer(
                  imagePath: controller.selectedProfilePicImagepath.value,
                  onTapOpenGallery: () {
                    controller.getLogo6Image(ImageSource.gallery);
                    Get.back();
                  },
                  onTapOpenCamera: () {
                    controller.getLogo6Image(ImageSource.camera);
                    Get.back();
                  })
                  : openedSmallImageContainer(
                  openedImagePath: controller.selectedProfilePicImagepath.value,
                  onTapRemoveImage: () {
                    controller.removeLogo6Image();
                  },)),
            ]),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(
              wrapper: controller.name,
              hintText: "Name",
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(
              wrapper: controller.placeOfBirth,
              hintText: "Place of birth",
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            GestureDetector(
              child: AbsorbPointer(
                child: CommonInputField(
                  wrapper: controller.dateOfBirth,
                  hintText: "Date of birth",
                  suffixIcon: const Icon(Icons.calendar_month),
                ),
              ),
              onTap: () {
                controller.chooseDateOfBirth();
              },
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(wrapper:controller.age,hintText:'Age',),
            SizedBox(height: Dimens.scaleX2,),
            Row(
              children: [
                const Text(
                  'Gender',
                  style: AppStyles.tsSecondaryRegular700,
                ),
                Obx(
                      () => Radio(
                    value: "MALE",
                    groupValue: controller.genderValue.value,
                    onChanged: (value) {
                      print(value);
                      controller.onChangeGender(value.toString());
                    },
                  ),
                ),

                const Text(
                  "Male",
                  style: AppStyles.tsSecondaryRegular18,
                ),
                Obx(
                      () => Radio(
                    value: "FEMALE",
                    groupValue: controller.genderValue.value,
                    onChanged: (value) {
                      print(value);
                      controller.onChangeGender(value.toString());
                    },
                  ),
                ),
                const Text(
                  "Female",
                  style: AppStyles.tsSecondaryRegular18,
                ),
              ],
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(
              wrapper: controller.emailId,
              hintText: "Email",
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(wrapper: controller.address, hintText: "Address",maxLine:3,),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(
              wrapper: controller.city,
              hintText: "City",
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(
              wrapper: controller.state,
              hintText: "State",
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(
              wrapper: controller.pinCode,
              hintText: "Pin Code",
            ),
            const SizedBox(
              height: Dimens.scaleX2,
            ),
            CommonInputField(
              wrapper: controller.candidateBrief,
              hintText: "Candidate Brief",
              maxLine: 3,
            ),
            const SizedBox(
              height: Dimens.scaleX4,
            ),
            CommonFilledButton(
                text: "Save & Next",
                onTap: () {
                  Get.toNamed(Routes.PROFILE_CANDIDATE_INFO);
                }),
            const SizedBox(height: Dimens.scaleX4,),
            CommonResetButton(text:"Reset", onTap:(){
              controller.onResetAboutPage();
            })
          ]).paddingSymmetric(horizontal: Dimens.paddingX3),
        ),
      ),
    );
  }
}
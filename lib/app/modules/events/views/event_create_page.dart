import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prasada_political_portfolio/app/modules/events/controllers/event_controller.dart';

import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/events/widgets/event_list_view.dart';
import 'package:prasada_political_portfolio/widgets/common/common_button.dart';
import 'package:prasada_political_portfolio/widgets/common/common_input_field.dart';
import 'package:prasada_political_portfolio/widgets/common/common_small_image_container.dart';
import 'package:prasada_political_portfolio/widgets/common/custom_event_stepper.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';

import '../../../../utils/snackbar/snackbar.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../widgets/common_event_title_text.dart';

class EventCreatePage extends StatelessWidget {
  const EventCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      body: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: Dimens.imageScaleX3,
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const Center(
                      child: Text(
                    "Events",
                    style: AppStyles.tsSecondaryRegular700,
                  )),
                ],
              ),
              CustomEventStepper(),
            ],
          ),
          Expanded(child: EventData())
        ],
      ),
    );
  }
}

class EventData extends StatelessWidget {
  EventData({Key? key}) : super(key: key);
  EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (BuildContext context, index) {
          return Column(children: [
            Row(children: [
              const SizedBox(
                width: Dimens.imageScaleX2,
              ),
              Obx(() => controller
                      .selectedEventCreateFirstImagePath.value.isEmpty
                  ? CommonSmallImageContainer(
                      imagePath:
                          controller.selectedEventCreateFirstImagePath.value,
                      onTapOpenGallery: () {
                        controller
                            .getEventCreateFirstImage(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getEventCreateFirstImage(ImageSource.camera);
                        Get.back();
                      })
                  : openedSmallImageContainer(
                      openedImagePath:
                          controller.selectedEventCreateFirstImagePath.value,
                      onTapRemoveImage: () {
                        controller.removeEventCreateFirstImage();
                      })),
              const SizedBox(
                width: Dimens.imageScaleX2,
              ),
              Obx(() => controller
                      .selectedEventCreateSecondImagePath.value.isEmpty
                  ? CommonSmallImageContainer(
                      imagePath:
                          controller.selectedEventCreateSecondImagePath.value,
                      onTapOpenGallery: () {
                        controller
                            .getEventCreateSecondImage(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller
                            .getEventCreateSecondImage(ImageSource.camera);
                        Get.back();
                      })
                  : openedSmallImageContainer(
                      openedImagePath:
                          controller.selectedEventCreateSecondImagePath.value,
                      onTapRemoveImage: () {
                        controller.removeEventCreateSecondImage();
                      })),
              const SizedBox(
                width: Dimens.imageScaleX2,
              ),
              Obx(() => controller
                      .selectedEventCreateThirdImagePath.value.isEmpty
                  ? CommonSmallImageContainer(
                      imagePath:
                          controller.selectedEventCreateThirdImagePath.value,
                      onTapOpenGallery: () {
                        controller
                            .getEventCreateThirdImage(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller.getEventCreateThirdImage(ImageSource.camera);
                        Get.back();
                      })
                  : openedSmallImageContainer(
                      openedImagePath:
                          controller.selectedEventCreateThirdImagePath.value,
                      onTapRemoveImage: () {
                        controller.removeEventCreateSecondImage();
                      })),
              const SizedBox(
                width: Dimens.imageScaleX2,
              ),
              Obx(() => controller
                      .selectedEventCreateFourthImagePath.value.isEmpty
                  ? CommonSmallImageContainer(
                      imagePath:
                          controller.selectedEventCreateFourthImagePath.value,
                      onTapOpenGallery: () {
                        controller
                            .getEventCreateFourthImage(ImageSource.gallery);
                        Get.back();
                      },
                      onTapOpenCamera: () {
                        controller
                            .getEventCreateFourthImage(ImageSource.camera);
                        Get.back();
                      })
                  : openedSmallImageContainer(
                      openedImagePath:
                          controller.selectedEventCreateFourthImagePath.value,
                      onTapRemoveImage: () {
                        controller.removeEventCreateFourthImage();
                      })),
            ]),
            const CommonEventTitle(text: 'Event Title'),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.imageScaleX3,
                  right: Dimens.imageScaleX3,
                  top: Dimens.imageScaleX3),
              child: CommonInputField(
                wrapper: controller.titleTextController,
                hintText: "Type your Title",
              ),
            ),
            const CommonEventTitle(text: 'Event Description'),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.imageScaleX3,
                  right: Dimens.imageScaleX3,
                  top: Dimens.imageScaleX3),
              child: CommonInputField(
                wrapper: controller.descriptionTextController,
                hintText: "Type your Description",
                maxLine: 3,
              ),
            ),
            const CommonEventTitle(text: 'Event Category'),
            ListSelector(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.imageScaleX3,
                      right: Dimens.imageScaleX3,
                      top: Dimens.imageScaleX3),
                  child: CommonInputField(
                    wrapper: controller.eventCategoryDropDownText,
                    hintText: 'Select',
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
                onTap: (value) async {
                  controller.eventCategoryDropDownText.controller.text = value;
                },
                title: 'Event Category',
                data: const [
                  "Conference",
                  "Seminars/Workshop",
                  "Business Networking",
                  "Social Gathering",
                  "Charity & Fundraising",
                  "Launching",
                  "Work related",
                  "Meet and networking",
                  "Panel Discussions",
                  "Others",
                ]),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: Dimens.scaleX5, top: Dimens.scaleX5),
                  width: Dimens.imageScaleX24,
                  height: Dimens.imageScaleX7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.imageScaleX2),
                    color: AppColors.whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => controller.selectedEventStartDate.value != null
                          ? Text(DateFormat('dd-MM-yyyy').format(controller
                              .selectedEventStartDate.value!
                              .toLocal()))
                          : const Text('Select')),
                      InkWell(
                        child: const Icon(Icons.calendar_today),
                        onTap: () {
                          controller.chooseEventStartDate();
                          print(controller.selectedEventStartDate.value);
                        },
                      )
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: Dimens.paddingX4),
                        child: Text(
                          "Start Date",
                          style: AppStyles.tsSecondaryRegular700,
                        ))
                  ],
                )
              ],
            ),
            Obx(() => (Visibility(
                  visible: controller.showEndDateContainer.value,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: Dimens.scaleX5, top: Dimens.scaleX2),
                        width: Dimens.imageScaleX24,
                        height: Dimens.imageScaleX7,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimens.imageScaleX2),
                          color: AppColors.whiteColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() =>
                                controller.selectedEventEndDate.value != null
                                    ? Text(DateFormat('dd-MM-yyyy').format(
                                        controller.selectedEventEndDate.value!
                                            .toLocal()))
                                    : const Text('Select')),
                            InkWell(
                              child: const Icon(Icons.calendar_today),
                              onTap: () {
                                controller.chooseEventEndDate();
                                print(controller.selectedEventEndDate.value);
                              },
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: Dimens.paddingX5),
                        child: Text(
                          "End Date",
                          style: AppStyles.tsSecondaryRegular700,
                        ),
                      ),
                    ],
                  ),
                ))),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: Dimens.imageScaleX16),
                child: Obx(
                  () => Text(
                    controller.showEndDateContainer.value
                        ? 'x Remove'
                        : "+ Add End Data",
                    style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              onTap: () {
                controller.showContainer();
                controller.showEndDateContainer.value == true
                    ? controller.selectedEventEndDate.value = null
                    : '';
              },
            ),
            const CommonEventTitle(text: "Location"),
            Row(
              children: [
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: Dimens.paddingX5),
                    child: Radio(
                      value: "Online",
                      groupValue: controller.selectedLocationValue.value,
                      onChanged: (value) {
                        print(value);
                        controller.onChangeLocation(value.toString());
                      },
                    ),
                  ),
                ),
                const Text("Online"),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.only(left: Dimens.paddingX5),
                    child: Radio(
                      value: "Offline",
                      groupValue: controller.selectedLocationValue.value,
                      onChanged: (value) {
                        print(value);
                        controller.onChangeLocation(value.toString());
                      },
                    ),
                  ),
                ),
                const Text("Offline"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.imageScaleX3,
                  right: Dimens.imageScaleX3,
                  top: Dimens.imageScaleX3),
              child: CommonInputField(
                wrapper: controller.eventLocationAddress,
                hintText: 'Enter your Location Address/Link',
              ),
            ),
            const CommonEventTitle(text: "Event Contacts"),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.imageScaleX3,
                  right: Dimens.imageScaleX3,
                  top: Dimens.imageScaleX3),
              child: CommonInputField(
                wrapper: controller.contactsTextController,
                hintText: 'Phone mail or contact details',
              ),
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
                  controller.contactsTextController.controller.text.isEmpty
                      ? Error_message("Error", "Enter Valid Text")
                      : controller.onAddContactsList(
                          controller.contactsTextController.controller.text);
                  controller.contactsTextController.controller.clear();
                },
              ),
            ),
            Obx(() => controller.contactLists.isEmpty
                ? const Text("")
                : Column(
                    children:
                        List.generate(controller.contactLists.length, (index) {
                      return ListTile(
                        title: Text(controller.contactLists[index]),
                        trailing: IconButton(
                            onPressed: () {
                              controller.onRemoveContactsList(index);
                            },
                            icon: const Icon(Icons.cancel)),
                      );
                    }, growable: true),
                  )),
            const CommonEventTitle(text: 'Virtual/Streaming Link'),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.imageScaleX3,
                  right: Dimens.imageScaleX3,
                  top: Dimens.imageScaleX3),
              child: CommonInputField(
                wrapper: controller.virtualLinkTextController,
                hintText: 'ex:https://www.Eventlink.com',
              ),
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
                  controller.virtualLinkTextController.controller.text.isEmpty
                      ? Error_message("Error", "Enter Valid Text")
                      : controller.onAddVirtualLinks(
                          controller.virtualLinkTextController.controller.text);
                  controller.virtualLinkTextController.controller.clear();
                },
              ),
            ),
            Obx(() => controller.virtualLinkLists.isEmpty
                ? const Text("")
                : EventLinkListView(
                    count: controller.virtualLinkLists.length,
                    textLinkList: controller.virtualLinkLists,
                    icon: const Icon(Icons.cancel),
                  )),
            Padding(
              padding: const EdgeInsets.all(Dimens.imageScaleX3),
              child: CommonFilledButton(
                  text: "Saved Next",
                  onTap: () {
                    Get.toNamed(Routes.EVENT_SCHEDULE_PAGE);
                  }),
            )
          ]);
        });
  }
}

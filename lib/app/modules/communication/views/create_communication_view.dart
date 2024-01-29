import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/communication/views/send_draft_view.dart';

import '../../../../widgets/common/common_button.dart';
import '../../../../widgets/common/common_communication_widget.dart';
import '../../../../widgets/common/common_input_field.dart';
import '../../../../widgets/common/common_text.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../controllers/communication_view_controller.dart';
import '../controllers/create_communication_view_controller.dart';

class CreateCommunicationView extends StatelessWidget {
  CreateCommunicationView({Key? key}) : super(key: key);
  CreateCommunicationViewController controller = Get.find();
  final CommunicationViewController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Column(children: [
          // Container(
          //     height: Dimens.screenHeightX16,
          //     decoration: const BoxDecoration(
          //         color: AppColors.whiteColor,
          //         boxShadow: [
          //           BoxShadow(
          //               offset: Offset(0, 4),
          //               color: Colors.black38,
          //               blurRadius: 4)
          //         ]),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         IconButton(
          //             onPressed: () {
          //               Get.toNamed(Routes.COMMUNICATION_FILTER_VIEW);
          //             },
          //             icon: const Icon(Icons.arrow_back_ios_new)),
          //         const Expanded(
          //             child: Center(
          //                 child: Text(
          //           "Create Communication",
          //           style: AppStyles.tsSecondaryRegular700,
          //         ))),
          //       ],
          //     )),
          Flexible(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX3,
                        right: Dimens.gapX3,
                        top: Dimens.gapX3),
                    child: CommonInputField(
                      wrapper: controller.communicationName,
                      hintText: "Communication Name",
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX3,
                        right: Dimens.gapX3,
                        top: Dimens.gapX3),
                    child: CommonInputField(
                      wrapper: controller.description,
                      hintText: "Description/Note",
                    )),
                const SizedBox(height: Dimens.gapX2),
                const Padding(
                    padding: EdgeInsets.only(left: Dimens.gapX3),
                    child: CommonText(text: "Communication Type")),
                Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX3, top: Dimens.gapX1),
                    child: Obx(() => CustomCheckbox(
                        label: "SMS",
                        value: controller.smsCheck.value,
                        onChanged: (value) {
                          controller.smsCheck.value =
                              !controller.smsCheck.value;
                        }))),
                Padding(
                    padding: const EdgeInsets.only(left: Dimens.gapX3),
                    child: Obx(() => CustomCheckbox(
                        label: "WhatsApp",
                        value: controller.whatsApp.value,
                        onChanged: (value) {
                          controller.whatsApp.value =
                              !controller.whatsApp.value;
                        }))),
                Padding(
                    padding: const EdgeInsets.only(left: Dimens.gapX3),
                    child: Obx(() => CustomCheckbox(
                        label: "Telegram",
                        value: controller.telegram.value,
                        onChanged: (value) {
                          controller.telegram.value =
                              !controller.telegram.value;
                        }))),
                Padding(
                    padding: const EdgeInsets.only(left: Dimens.gapX3),
                    child: Obx(() => CustomCheckbox(
                        label: "Instagram",
                        value: controller.instagram.value,
                        onChanged: (value) {
                          controller.instagram.value =
                              !controller.instagram.value;
                        }))),
                Padding(
                    padding: const EdgeInsets.only(left: Dimens.gapX3),
                    child: Obx(() => CustomCheckbox(
                        label: "IVRS",
                        value: controller.ivrs.value,
                        onChanged: (value) {
                          controller.ivrs.value = !controller.ivrs.value;
                        }))),
                Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX2, right: Dimens.gapX2),
                    child: Obx(() => CheckboxListTile(
                          title: const Text("Email"),
                          value: controller.email.value,
                          checkColor: AppColors.whiteColor,
                          activeColor: AppColors.blue,
                          onChanged: (value) {
                            controller.email.value = value ?? false;
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ))),
                Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX3, right: Dimens.gapX3),
                    child: Obx(() => CommonInputField(
                          wrapper: controller.emailSubject,
                          hintText: "Subject Line",
                          isEnabled: controller.email.value,
                          onChanged: (text) {
                            controller.emailSubjectTextField.value = text;
                          },
                        ))),
                const SizedBox(
                  height: Dimens.gapX1,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX3, right: Dimens.gapX3),
                    child: Obx(() => CommonInputField(
                          wrapper: controller.emailMessage,
                          hintText: "Comments",
                          isEnabled: controller.email.value,
                          onChanged: (text) {
                            controller.emailMessageTextField.value = text;
                          },
                        ))),
                const SizedBox(
                  height: Dimens.gapX3,
                ),
                Container(
                  height: Dimens.screenHeightX3,
                  width: Dimens.screenWidthX12,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Text Message",
                        style: AppStyles.tsSecondaryRegular18,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.gapX1, right: Dimens.gapX1),
                          child: CommonInputField(
                            wrapper: controller.textSubject,
                            hintText: "Subject Line",
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: Dimens.gapX1, right: Dimens.gapX1),
                          child: CommonInputField(
                            wrapper: controller.textMessage,
                            hintText: "Message",
                          )),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX6,
                        right: Dimens.gapX6,
                        top: Dimens.paddingX3),
                    child: CommonFilledButton(
                        text: "Send Communication",
                        onTap: () {
                          _controller.onAddCommunication();
                          Get.to(() => CommunicationSentField());
                        })),
                Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.gapX6,
                        right: Dimens.gapX6,
                        top: Dimens.paddingX3,
                        bottom: Dimens.paddingX2),
                    child: CommonFilledButton(
                      text: "Save as Draft",
                      onTap: () {
                        _controller.onAddCommunication();
                        Get.to(() => const CommunicationDraftField());
                      },
                      isFilled: false,
                    ))
              ],
            ),
          ))
        ]));
  }
}

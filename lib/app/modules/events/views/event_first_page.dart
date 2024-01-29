import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prasada_political_portfolio/widgets/common/list_selector.dart';
import '../../../../widgets/common/common_input_field.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../../widgets/custom_widget.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../controllers/event_controller.dart';

class EventFirstPage extends StatelessWidget {
  EventFirstPage({Key? key}) : super(key: key);
  EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(left: Dimens.scaleX7, right: Dimens.scaleX7),
        child: CustomButton(
          buttonName: '+ Create Events',
          onTap: () {
            Get.toNamed(Routes.EVENT_CREATE_PAGE);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListSelector(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.paddingX4,
                      right: Dimens.paddingX4,
                      top: Dimens.paddingX4,
                      bottom: Dimens.paddingX4),
                  child: CommonInputField(
                    wrapper: controller.eventFirstPageDropDownText,
                    hintText: "View All",
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
                onTap: (value) async {
                  controller.eventFirstPageDropDownText.controller.text = value;
                },
                title: "View All",
                data: controller.eventTypeList),
            Obx(() => controller.eventCreateContainersList.isEmpty
                ? const Text("")
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: Dimens.paddingX5,
                            bottom: Dimens.paddingX3,
                            left: Dimens.paddingX5,
                            right: Dimens.paddingX5),
                        child: InkWell(
                          child: Container(
                              height: Dimens.screenHeightX34,
                              color: AppColors.whiteColor,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(
                                        Icons.calendar_month_outlined),
                                    title: Center(
                                        child: Text(
                                      controller
                                          .titleTextController.controller.text,
                                      style: AppStyles.tsBlackBold20,
                                    )),
                                    subtitle: Column(
                                      children: [
                                        Obx(() => controller
                                                    .selectedEventStartDate
                                                    .value !=
                                                null
                                            ? Text(
                                                "${DateFormat('dd-MM-yyyy').format(controller.selectedEventStartDate.value!.toLocal())}| ${controller.getFormattedStartTime()}",
                                                style:
                                                    AppStyles.tsBlackMedium12,
                                              )
                                            : const Text("Select")),
                                        Text(
                                          controller.descriptionTextController
                                              .controller.text,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: AppStyles.tsBlackMedium12,
                                        )
                                      ],
                                    ),
                                  ),
                                  ListTile(
                                    leading:
                                        const Icon(Icons.location_on_outlined),
                                    title: Text(
                                      controller.selectedLocationValue.value,
                                      textAlign: TextAlign.center,
                                      style: AppStyles.tsBlackMedium12,
                                    ),
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                        Icons.share_arrival_time_rounded),
                                    title: Column(
                                      children: [
                                        Obx(
                                          () => controller
                                                      .selectedEventStartDate
                                                      .value ==
                                                  null
                                              ? const Text("Select")
                                              : Text(
                                                  "${DateFormat('dd-MM-yyyy').format(controller.selectedEventStartDate.value!.toLocal())}| ${controller.getFormattedStartTime()}",
                                                  style:
                                                      AppStyles.tsBlackMedium12,
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.published_with_changes),
                                    title: Text(
                                      "Published",
                                      style: TextStyle(color: Colors.green),
                                      textAlign: TextAlign.center,
                                    ),
                                    subtitle: Text(
                                      "Communicated",
                                      style: TextStyle(color: Colors.green),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              )),
                          onLongPress: () {
                            Get.toNamed(Routes.EVENT_PREVIEW_PAGE);
                          },
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}

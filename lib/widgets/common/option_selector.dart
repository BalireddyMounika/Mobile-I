import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';

class OptionSelector extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final String title;
  final bool? isListEnable;
  final List<String> data;
  final String emptyLabel;
  final String msgWhenListDisable;

  const OptionSelector({
    Key? key,
    required this.child,
    required this.onTap,
    required this.title,
    required this.data,
    this.emptyLabel = "",
    this.msgWhenListDisable = "",
    this.isListEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    RxList<String> tempList = RxList(data);

    return GestureDetector(
      onTap: () {
        if (isListEnable ?? true) {
          Get.bottomSheet(
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimens.gapX2),
                Text(title,
                        style:
                            AppStyles.tsBlackMedium14.copyWith(fontSize: 16.0))
                    .paddingSymmetric(horizontal: Dimens.paddingX4),
                SizedBox(height: Dimens.gapX2),
                SizedBox(
                  height: Dimens.screenHeightX34,
                  child: Column(
                    children: [
                      Expanded(
                        child: Obx(
                          () => data.isNotEmpty
                              ? ListView(
                                  padding: const EdgeInsets.only(),
                                  children: [
                                    for (String value in tempList)
                                      ListTile(
                                          dense: true,
                                          title: Text(value),
                                          onTap: () {
                                            controller.text = "";
                                            tempList.value = [];
                                            tempList.value = data;
                                            Get.back();
                                            onTap(value);
                                          })
                                  ],
                                )
                              : Center(
                                  child: Text(
                                  emptyLabel,
                                  style: AppStyles.tsBaseRegular14,
                                )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: AppColors.whiteColor,
            ignoreSafeArea: true,
          );
        } else {
          AppUtils.showSnackBar(msgWhenListDisable);
        }
      },
      child: AbsorbPointer(
        absorbing: true,
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';

class ListSelector extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final String title;
  final bool? isListEnable;
  final List<String> data;
  final String emptyLabel;
  final String msgWhenListDisable;

  const ListSelector({
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
          AppUtils.getBottomSheet(children: [
            Text(title,
                style: AppStyles.tsBlackMedium14.copyWith(fontSize: 16.0)),
            SizedBox(height: 10.0),
            SizedBox(
              height: Dimens.screenHeight / 2.8,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    onChanged: (String val) {
                      if (val.isNotEmpty) {
                        tempList.value = [];
                        List<String> temp = data
                            .where((element) => element
                                .toLowerCase()
                                .contains(val.toLowerCase()))
                            .toList();
                        tempList.addAll(temp);
                      } else {
                        tempList.value = data;
                      }
                    },
                    style: AppStyles.tsBlackRegular14,
                    decoration: InputDecoration(
                      isDense: true,
                      suffixIcon: Icon(Icons.search, size: 24),
                      hintText: "Search $title",
                    ),
                  ),
                  SizedBox(height: 8.0),
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
          ]);
        } else {
          // AppUtils.showSnackBar(msgWhenListDisable);
          AppUtils.showSnackBar("List is Disabled");
        }
      },
      child: AbsorbPointer(
        absorbing: true,
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:prasada_political_portfolio/app/data/model/response/QuickInsightResponse.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:prasada_political_portfolio/widgets/common/common_container.dart';

class InsightCard extends StatelessWidget {
  final QuickInsightResponse insightData;
  final onUpdate;
  final bool isSelected;
  final onSelect;
  final onLongPress;
  const InsightCard(
      {Key? key,
      required this.insightData,
      required this.isSelected,
      this.onSelect,
      this.onLongPress,
      this.onUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      onLongPress: onLongPress,
      child: CommonContainer(
        isBorder: false,
        radius: Dimens.radius10,
        backGroundColor:
            isSelected ? AppColors.selectedColor : AppColors.liteGreyColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  iconWithValue(
                      icon: Icons.person,
                      value: insightData.nameOfYourQuickInsights),
                  SizedBox(height: Dimens.gapX2),
                  iconWithValue(
                    icon: Icons.person,
                    valueWidget: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Created On',
                            style: AppStyles.tsBlackRegular12,
                          ),
                          SizedBox(height: Dimens.gapX0_5),
                          Text(
                            formatDateTime(insightData.createdOn ?? ''),
                            // '22-Jun-2023 | 11:20 PM | Thursdlkjay'
                            style: AppStyles.tsBlackRegular14,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Dimens.gapX2),
                  iconWithValue(
                    icon: Icons.group,
                    valueWidget: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            insightData.count != null
                                ? insightData.count.toString()
                                : '0',
                            style: AppStyles.tsBlackRegular20
                                .copyWith(color: AppColors.baseColor),
                          ),
                          SizedBox(height: Dimens.gapX0_5),
                          Text(
                            'Total',
                            style: AppStyles.tsBlackRegular14,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: onUpdate,
                child: Column(
                  children: [
                    Icon(
                      Icons.update_outlined,
                      color: AppColors.blue,
                    ),
                    SizedBox(height: Dimens.gapX1),
                    Text('data', style: AppStyles.tsBlackRegular14),
                    Text(
                      formatDateTime(insightData.updatedOn ?? ''),
                      style: AppStyles.tsBlackRegular12,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
            )
          ],
        ).paddingAll(Dimens.gapX1),
      ),
    );
  }
}

String formatDateTime(String date) {
  DateTime dateTime = DateTime.parse(date);
  final dateFormat = DateFormat('d-MMM-y | hh:mm a | EEEE');
  return dateFormat.format(dateTime);
}

Widget iconWithValue(
    {required IconData icon, String? value, Widget? valueWidget}) {
  return Row(
    children: [
      Icon(icon, size: 24, color: AppColors.black),
      SizedBox(width: Dimens.gapX1),
      if (value != null && value.isNotEmpty)
        Expanded(
          child: Text(
            value,
            style: AppStyles.tsBlackRegular14,
            maxLines: 3,
          ),
        ),
      if (valueWidget != null) valueWidget,
    ],
  );
}

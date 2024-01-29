import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommonInChargeDetails extends StatelessWidget {
  final String inChargeName;
  final String inChargePossition;
  final String inChargeNumber;
  const CommonInChargeDetails(
      {required this.inChargeName,
      required this.inChargePossition,
      required this.inChargeNumber,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$inChargeName', style: AppStyles.tsBlackMedium18),
        Text('$inChargePossition', style: AppStyles.tsBlackRegular14),
        SizedBox(height: Dimens.gapX1),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: AppColors.blue,
              size: 20,
            ),
            SizedBox(width: Dimens.gapX1),
            Text(
              inChargeNumber,
              style: AppStyles.tsBlackRegular16,
            ),
            Spacer(),
            InkWell(
                onTap: () async {
                  var phoneNumber = inChargeNumber;
                  if (await canLaunchUrlString('tel:$phoneNumber')) {
                    await launchUrlString('tel:$phoneNumber');
                  } else {
                    throw 'Could not launch $phoneNumber';
                  }
                },
                child: Text(
                  'Call',
                  style: AppStyles.tsBlackMedium14
                      .copyWith(color: AppColors.baseColor, letterSpacing: 1.2),
                ))
          ],
        ),
      ],
    ).paddingSymmetric(horizontal: Dimens.paddingX2);
  }
}

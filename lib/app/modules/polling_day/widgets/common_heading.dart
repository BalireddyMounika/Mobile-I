import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class CommonHeading extends StatelessWidget {
  String? textData;
  CommonHeading({
    Key? key,
    required this.textData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      "${textData} : ",
      style: AppStyles.tsBlackBold22,
    );
  }
}

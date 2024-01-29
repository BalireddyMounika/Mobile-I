import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class CommonText extends StatelessWidget {
  final String text;
  const CommonText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: AppStyles.tsBlackRegular16,
      ),
    );
  }
}

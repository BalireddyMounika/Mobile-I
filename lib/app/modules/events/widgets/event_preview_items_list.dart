import 'package:flutter/material.dart';

import '../../../data/values/dimens.dart';
import '../../../themes/app_styles.dart';

class EventPreviewListItems extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextOverflow overflow;

  const EventPreviewListItems({
    Key? key,
    required this.text,
    required this.icon,
    required this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
          top: Dimens.paddingX3,
          left: Dimens.paddingX3),
      child: Row(
        children: [
          icon,
          const SizedBox(width:Dimens.scaleX3,),
          Text(
           text,
            style: AppStyles.tsSecondaryRegular18,
            overflow: overflow,
          ),
        ],
      ),
    );
  }
}

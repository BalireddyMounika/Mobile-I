import 'package:flutter/material.dart';

import '../../../data/values/dimens.dart';
import '../../../themes/app_colors.dart';

class ProfilePreviewText extends StatelessWidget {
  final String SideText;
  final String MainText;

  ProfilePreviewText({
    required this.SideText,
    required this.MainText,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.scaleX2),
              child: Text(MainText,style:TextStyle(color: AppColors.secondaryColor,fontSize:20,fontWeight: FontWeight.w500)),
            ),
            Expanded(
              child: Text(SideText,style:TextStyle(color: AppColors.secondaryColor,
                  fontSize:20),maxLines:5,
                softWrap:false,overflow:TextOverflow.ellipsis,),
            ),
          ],
        ),
      ],
    );
  }
}
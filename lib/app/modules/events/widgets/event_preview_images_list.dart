import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';

class EventPreviewImagesList extends StatelessWidget {
  final int count;
  final List imagesList;
  final List textLinkList;

  const EventPreviewImagesList({
    Key? key,
    required this.count,
    required this.textLinkList,
    required this.imagesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(count, (index) {
          return Column(
            children: [
              Container(
                width: Dimens.imageScaleX12,
                height: Dimens.imageScaleX12,
                margin:
                const EdgeInsets.only(left: Dimens.scaleX3,top:Dimens.scaleX3,bottom:Dimens.scaleX2,right:Dimens.scaleX1),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.secondaryColor),
                  borderRadius:BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: FileImage(File(imagesList[index])),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(textLinkList[index],style:AppStyles.tsSecondaryRegular18,overflow:TextOverflow.clip,)
            ],
          );
        }),
      ),
    );
  }
}

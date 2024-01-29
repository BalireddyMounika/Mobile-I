import 'dart:io';

import 'package:flutter/material.dart';

import '../../../data/values/dimens.dart';
import '../../../themes/app_colors.dart';

class EventImageListView extends StatelessWidget {

  final int count;
  final List textLinkList;
  final List imagesList;
  final icon;

  const EventImageListView({
    Key? key,
    required this.count,
    required this.textLinkList,
    required this.imagesList,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:List.generate(count, (index){
        return Padding(
          padding: const EdgeInsets.only(top:Dimens.imageScaleX1),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: Dimens.imageScaleX9,
                  height: Dimens.imageScaleX9,
                  margin:
                  const EdgeInsets.only(left: Dimens.scaleX1),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.secondaryColor),
                    image: DecorationImage(
                      image: FileImage(File(imagesList[index])),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(textLinkList[index],overflow: TextOverflow.ellipsis,),
                InkWell(
                  child: icon,
                  onTap: () {
                    textLinkList.removeAt(index);
                    imagesList.removeAt(index);
                  },
                )
              ]),
        );
      }),
    );
  }
}

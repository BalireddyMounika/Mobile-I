import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';

import '../../../themes/app_colors.dart';

class ProfileCircularImageContainer extends StatelessWidget {

  final String imagePath;
  final double height;
  final double width;

  const ProfileCircularImageContainer({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.imageScaleX2),
      child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.secondaryColor),
                    borderRadius: BorderRadius.circular(Dimens.imageScaleX6),
                    image: DecorationImage(
                      image:FileImage(File(imagePath)),
                      fit: BoxFit.fill,
                    ),
                  ),
      ),
    );
  }
}

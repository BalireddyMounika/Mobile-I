import 'dart:io';
import 'package:flutter/material.dart';

import '../../app/data/values/dimens.dart';
import '../../app/modules/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../../app/themes/app_colors.dart';

class CommonSmallImageContainer extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTapOpenGallery;
  final VoidCallback onTapOpenCamera;

  const CommonSmallImageContainer({
    Key? key,
    required this.imagePath,
    required this.onTapOpenGallery,
    required this.onTapOpenCamera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimens.scaleX1),
      child: Container(
        width:Dimens.imageScaleX10,
        height: Dimens.imageScaleX10,
        decoration: BoxDecoration(
            border:
            Border.all(color: AppColors.secondaryColor)),
        child: IconButton(
          icon: Icon(Icons.add_a_photo_rounded),
          onPressed: () {
            Get.defaultDialog(
              title: 'Please choose media to select',
              content: Container(
                // height: MediaQuery.of(context).size.height / 6,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed:onTapOpenGallery,
                      child: Row(
                        children: [
                          Icon(Icons.image),
                          Text('From Gallery'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed:onTapOpenCamera,
                      child: Row(
                        children: [
                          Icon(Icons.camera_alt),
                          Text('From Camera'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class openedSmallImageContainer extends StatelessWidget {
  final String openedImagePath;
  final VoidCallback onTapRemoveImage;

  const openedSmallImageContainer({
    Key? key,
    required this.openedImagePath,
    required this.onTapRemoveImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Dimens.imageScaleX10,
      height: Dimens.imageScaleX10,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor),
        image: DecorationImage(
          image: FileImage(File(openedImagePath)),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment(1.15, -1.15),
        child: InkWell(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.cancel,
                  size: 20.0,
                )),
            onTap:onTapRemoveImage
        ),
      ),
    );
  }
}
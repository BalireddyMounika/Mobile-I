import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/values/dimens.dart';
import '../../app/themes/app_colors.dart';

class ImageContainer extends StatelessWidget {

  final String imagePath;
  final VoidCallback onTapOpenGallery;
  final VoidCallback onTapOpenCamera;
  final double width;
  final double height;

  const ImageContainer({
    Key? key,
    required this.imagePath,
    required this.height,
    required this.width,
    required this.onTapOpenGallery,
    required this.onTapOpenCamera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height:height,
      margin:const EdgeInsets.only(right:Dimens.gapX2,top: Dimens.imageScaleX2),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.secondaryColor)),
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
                    //if user click this button, user can upload image from gallery
                    onPressed: onTapOpenGallery,
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
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
    );
  }
}

class ImageOpenContainer extends StatelessWidget {
  final String openedImagePath;
  final VoidCallback onTapRemoveImage;
  final double width;
  final double height;

  const ImageOpenContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.openedImagePath,
    required this.onTapRemoveImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height:height,
      margin:EdgeInsets.only(right:Dimens.gapX2,top:Dimens.imageScaleX2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor),
        image: DecorationImage(
          image:FileImage(File(openedImagePath)),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment(1.03, -1.02),
        child: InkWell(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.cancel,
                  size: Dimens.imageScaleX3,
                )),
            onTap:onTapRemoveImage
        ),
      ),
    );
  }
}
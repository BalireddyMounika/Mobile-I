import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/modules/profile/controller/profile_controller.dart';

class ProfileCarouselSlider extends StatelessWidget {
  ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        //1st Image of Slider
        Container(
          margin: EdgeInsets.all(Dimens.imageScaleX1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.imageScaleX1),
            image: DecorationImage(
              image: FileImage(File(controller.selectedLogo1Imagepath.value)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(Dimens.imageScaleX1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.imageScaleX1),
            image: DecorationImage(
              image: FileImage(File(controller.selectedLogo2Imagepath.value)),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //3rd Image of Slider
        Container(
          margin: EdgeInsets.all(Dimens.imageScaleX1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.imageScaleX1),
            image: DecorationImage(
              image: FileImage(File(controller.selectedLogo3Imagepath.value)),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //4th Image of Slider
        Container(
          margin: EdgeInsets.all(Dimens.imageScaleX1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.imageScaleX1),
            image: DecorationImage(
              image: FileImage(File(controller.selectedLogo4Imagepath.value)),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //5th Image of Slider
        Container(
          margin: EdgeInsets.all(Dimens.imageScaleX1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.imageScaleX1),
            image: DecorationImage(
              image: FileImage(File(controller.selectedLogo5Imagepath.value)),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      //Slider Container properties
      options: CarouselOptions(
        height: Dimens.imageScaleX16,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.linear,
        enableInfiniteScroll: false,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}

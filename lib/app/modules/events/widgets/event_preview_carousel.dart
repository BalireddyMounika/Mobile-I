import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/modules/events/controllers/event_controller.dart';
import 'package:get/get.dart';

import '../../../data/values/dimens.dart';

class EventPreviewCarousel extends StatelessWidget {
  EventsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: Dimens.paddingX3),
      child: CarouselSlider(
        items: [
          //1st Image of Slider
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: FileImage(
                    File(controller.selectedEventCreateFirstImagePath.value)),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //2nd Image of Slider
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: FileImage(
                    File(controller.selectedEventCreateSecondImagePath.value)),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //3rd Image of Slider
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: FileImage(
                    File(controller.selectedEventCreateThirdImagePath.value)),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //4th Image of Slider
          Container(
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: FileImage(
                    File(controller.selectedEventCreateFourthImagePath.value)),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        //Slider Container properties
        options: CarouselOptions(
          height: 130.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.linear,
          enableInfiniteScroll: false,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}

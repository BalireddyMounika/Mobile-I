import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/images.dart';
import '../../../data/values/dimens.dart';
import '../../../themes/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.snackbarColor,
      body: Padding(
        padding: const EdgeInsets.only(top: Dimens.gapX3, bottom: Dimens.gapX2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Animate(
                effects: const [
                  ScaleEffect(duration: Duration(seconds: 1)),
                  SlideEffect(
                      duration: Duration(seconds: 2),
                      begin: Offset(0, 0),
                      end: Offset(3.5, 0))
                ],
                child: Image(
                  height: Dimens.gapX7,
                  image: const AssetImage(AppImages.circles),
                ),
              ).then(),
            ),
            Animate(
              effects: const [
                ScaleEffect(duration: Duration(seconds: 1)),
                ScaleEffect(
                    begin: Offset(1, 1),
                    end: Offset(4, 4),
                    duration: Duration(seconds: 2)),
              ],
              child: Image(
                height: Dimens.gapX7,
                image: const AssetImage(AppImages.icAppLogo),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Animate(
                effects: const [
                  ScaleEffect(duration: Duration(seconds: 1)),
                  SlideEffect(
                      duration: Duration(seconds: 2),
                      begin: Offset(0, 0),
                      end: Offset(-3.5, 0))
                ],
                child: Image(
                  height: Dimens.gapX7,
                  image: const AssetImage(AppImages.circles),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

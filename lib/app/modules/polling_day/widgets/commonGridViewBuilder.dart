import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class CommonGridCard extends StatelessWidget {
  final String? partyName;
  final nonLocalAddress;
  final String? srNumber;
  final bool isBgGreen;
  final Function() onDoubleTap;

  const CommonGridCard({
    required this.partyName,
    this.nonLocalAddress = false,
    required this.srNumber,
    this.isBgGreen = false,
    required this.onDoubleTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Card(
        color: isBgGreen ? Color.fromARGB(255, 227, 244, 227) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              shape: const StadiumBorder(),
              color: partyName == null
                  ? AppColors.greyColor
                  : partyName == "Yuvajana Sramika Rythu Congress Party"
                      ? AppColors.blue
                      : partyName == "Telugu Desam Party"
                          ? AppColors.YellowColor
                          : partyName == "Janasena Party"
                              ? Colors.red
                              : partyName == "BJP"
                                  ? AppColors.baseColor
                                  : Colors
                                      .white, // Specify the color of the stadium-shaped border
              child: const SizedBox(
                width: 15, // Specify the width of your container
                height: 5, // Specify the height of your container
              ),
            ),
            nonLocalAddress == true
                ? Transform.rotate(
                    angle: 45 * (3.141592653589793 / 180),
                    child: const Icon(Icons.flight_sharp),
                  )
                : SvgPicture.asset(
                    "assets/images/poling.svg",
                    height: isBgGreen ? 30 : 35,
                  ),
            Text(
              "$srNumber",
              style: AppStyles.tsBlackBold14,
            ),
          ],
        ).paddingOnly(
          top: Dimens.gapX0_5,
        ),
      ),
    );
  }
}

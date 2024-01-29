import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/data/values/strings.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';

var currentIndex = 0.obs;
RxInt IconColor = RxInt(0);

void changePage(int index) {
  List pages = [Routes.HOME];
  currentIndex.value = index;
  IconColor = index.obs;
  print(index);
  Get.toNamed(pages[index]);
}

class CustomBottomNavigation extends StatelessWidget {
  CustomBottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: Dimens.screenWidthX12,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.secondaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: IconColor.value == 0
                      ? AppColors.blue
                      : AppColors.snackbarColor,
                ),
                label: AppStrings.home,
                backgroundColor: AppColors.snackbarColor),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.manage_search_rounded,
                color: IconColor.value == 1
                    ? AppColors.blue
                    : AppColors.snackbarColor,
              ),
              label: AppStrings.search,
              // backgroundColor: Colors.white
            ),
          ],
          currentIndex: currentIndex.value,
          onTap: (index) => changePage(index),
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.snackbarColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../app/data/values/dimens.dart';
import '../../app/themes/app_colors.dart';
import 'package:get/get.dart';

class CommonDateFieldContainer extends StatelessWidget {
  final String chooseDate;
  final VoidCallback onClickChooseDate;

  const CommonDateFieldContainer({
    Key? key,
    required this.chooseDate,
    required this.onClickChooseDate,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
        height: Dimens.imageScaleX6,
        color: AppColors.snackbarColor,
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: [
            Text(chooseDate),
            IconButton(
              onPressed:onClickChooseDate,
              icon:
              const Icon(Icons.calendar_month_outlined),
            ),
          ],
        ),
    );
  }
}

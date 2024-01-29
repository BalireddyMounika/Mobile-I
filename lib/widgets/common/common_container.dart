import 'package:flutter/cupertino.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';

class CommonContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final bool? isBorder;
  final Color? borderColor;
  final Color? backGroundColor;
  final double? height;
  const CommonContainer(
      {Key? key,
      required this.child,
      this.radius,
      this.isBorder,
      this.borderColor,
      this.backGroundColor,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: child,
      decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(radius ?? 0),
          border: Border.all(
              color: isBorder ?? false
                  ? borderColor ?? AppColors.black
                  : AppColors.transparent)),
    );
  }
}

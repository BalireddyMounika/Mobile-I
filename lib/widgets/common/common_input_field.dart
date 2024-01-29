import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

import '../../utils/helper/text_field_wrapper.dart';

class CommonInputField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final int? maxLine;
  final TextInputType inputType;
  final TextFieldWrapper wrapper;
  final bool isEnabled;
  final bool obscureText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final validator;
  final bool borderSide;

  const CommonInputField({
    Key? key,
    required this.wrapper,
    this.borderSide = false,
    this.hintText = '',
    this.maxLength,
    this.maxLine = 1,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.obscureText = false,
    this.suffixIcon,
    this.contentPadding,
    this.textInputAction,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bordersStyle = OutlineInputBorder(
      borderSide: borderSide
          ? BorderSide(color: AppColors.black.withOpacity(.8))
          : BorderSide(width: 0, color: AppColors.transparent),
      borderRadius: BorderRadius.circular(50),
    );
    return Obx(
      () => TextFormField(
        maxLines: maxLine,
        controller: wrapper.controller,
        style: AppStyles.tsBlackRegular16,
        maxLength: maxLength,
        keyboardType: inputType,
        enabled: isEnabled,
        obscureText: obscureText,
        textInputAction: textInputAction,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters ?? [],
        focusNode: focusNode,
        decoration: InputDecoration(
          errorMaxLines: null,
          isDense: true,
          errorText: wrapper.errorText.isEmpty ? null : wrapper.errorText,
          errorStyle:
              AppStyles.tsBlackRegular12.copyWith(color: AppColors.baseColor),
          hintStyle: AppStyles.tsBlackRegular16,
          counterText: '',
          fillColor: isEnabled
              ? AppColors.whiteColor.withOpacity(.6)
              : AppColors.greyColor.withOpacity(.6),
          filled: true,
          hintText: hintText,
          enabled: isEnabled,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                  vertical: Dimens.paddingX3, horizontal: Dimens.paddingX4),
          errorBorder: bordersStyle,
          border: bordersStyle,
          enabledBorder: bordersStyle,
          disabledBorder: bordersStyle,
          focusedBorder: bordersStyle,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../app/data/values/dimens.dart';
import '../../app/themes/app_styles.dart';
import '../../utils/helper/text_field_wrapper.dart';
import 'common_input_field.dart';
import 'list_selector.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool? value;
  final void Function(bool?)? onChanged;

  const CustomCheckbox({Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Dimens.screenWidth,
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
            ),
            const SizedBox(width: Dimens.gapX1),
            Text(
              label,
              style: AppStyles.tsBlackRegular14,
            ),
          ],
        ));
  }
}

class CommunicationDropDownWidget extends StatelessWidget {
  final bool? Value;
  final void Function(bool?)? onChanged;
  final TextFieldWrapper wrapper;
  final Function onTap;
  final String title;
  final List<String> data;
  final String hintText;

  const CommunicationDropDownWidget(
      {Key? key,
      this.Value,
      this.onChanged,
      required this.wrapper,
      required this.onTap,
      required this.title,
      required this.data,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Dimens.screenWidth,
        child: Row(
          children: [
            Checkbox(
              value: Value,
              onChanged: onChanged,
            ),
            Expanded(
                child: ListSelector(
                    child: CommonInputField(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      wrapper: wrapper,
                      hintText: hintText,
                    ),
                    onTap: onTap,
                    title: title,
                    data: data))
          ],
        ));
  }
}

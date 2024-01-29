import 'package:get/get.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';

class Edit_view_controller extends GetxController {
  RxString gender = RxString('');
  TextFieldWrapper state = TextFieldWrapper();
  TextFieldWrapper district = TextFieldWrapper();
  TextFieldWrapper constituency = TextFieldWrapper();
  TextFieldWrapper polling_station_number = TextFieldWrapper();
  TextFieldWrapper polling_station_name = TextFieldWrapper();
  TextFieldWrapper polling_station_location = TextFieldWrapper();
  TextFieldWrapper section_number_name = TextFieldWrapper();

  void genderfunction(String value) async {
    gender.value = value;
  }

  void ResetPage() {
    gender.value = "";
    state.controller.text = "";
    district.controller.text = "";
    constituency.controller.text = "";
    polling_station_number.controller.text = "";
    polling_station_name.controller.text = "";
    polling_station_location.controller.text = "";
    section_number_name.controller.text = "";
  }
}

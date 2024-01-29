import 'package:get/get.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';

class AdvanceDataAnalyticVoterController extends GetxController {
  TextFieldWrapper constituency = TextFieldWrapper();
  TextFieldWrapper mandal = TextFieldWrapper();
  TextFieldWrapper pollingStationNames = TextFieldWrapper();
  TextFieldWrapper sectionNameandNumber = TextFieldWrapper();
  TextFieldWrapper name = TextFieldWrapper();
  TextFieldWrapper lastname = TextFieldWrapper();
  TextFieldWrapper lastNameLikeSearch = TextFieldWrapper();
  TextFieldWrapper houseNo = TextFieldWrapper();
  TextFieldWrapper voterId = TextFieldWrapper();
  TextFieldWrapper filterby = TextFieldWrapper();

  RxString gender = RxString('');

  void genderfunction(String value) async {
    gender.value = value.toUpperCase();
  }

  void on_Reset_Page() {
    constituency.controller.text = "";
    mandal.controller.text = "";
    pollingStationNames.controller.text = "";
    sectionNameandNumber.controller.text = "";
    gender.value = "";
    name.controller.text = "";
    lastname.controller.text = "";
    lastNameLikeSearch.controller.text = "";
    houseNo.controller.text = "";
    voterId.controller.text = "";
  }
}

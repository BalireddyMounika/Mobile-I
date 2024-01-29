import 'package:get/get.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';

class Advance_data_analytic_voter_controller extends GetxController {
  TextFieldWrapper constituency = TextFieldWrapper();
  TextFieldWrapper mandal = TextFieldWrapper();
  TextFieldWrapper pollingstationnames = TextFieldWrapper();
  TextFieldWrapper sectionnameandnumber = TextFieldWrapper();
  TextFieldWrapper name = TextFieldWrapper();
  TextFieldWrapper lastname = TextFieldWrapper();
  TextFieldWrapper last_name_like_search = TextFieldWrapper();
  TextFieldWrapper house_no = TextFieldWrapper();
  TextFieldWrapper voter_id = TextFieldWrapper();
  TextFieldWrapper filterby = TextFieldWrapper();

  RxString gender = RxString('');

  void genderfunction(String value) async {
    gender.value = value.toUpperCase();
  }

  void on_Reset_Page() {
    constituency.controller.text = "";
    mandal.controller.text = "";
    pollingstationnames.controller.text = "";
    sectionnameandnumber.controller.text = "";
    gender.value = "";
    name.controller.text = "";
    lastname.controller.text = "";
    last_name_like_search.controller.text = "";
    house_no.controller.text = "";
    voter_id.controller.text = "";
  }
}

import 'package:get/get.dart';

class filter_view_controller extends GetxController {
  RxBool select_all_check_box = false.obs;
  RxBool caste_check_box = false.obs;
  RxBool contact_check_box = false.obs;
  RxBool party_check_box = false.obs;


  select_check(bool value) {
    if (caste_check_box.value == true && contact_check_box == true && party_check_box == true) {
      select_all_check_box.value = true;
    } else {
      select_all_check_box.value = false;
    }
  }

  select_all_on_change(value) {
    select_all_check_box.value = !select_all_check_box.value;
    caste_check_box.value = select_all_check_box.value;
    contact_check_box.value = select_all_check_box.value;
    party_check_box.value = select_all_check_box.value;
  }

  on_check_box_button(bool val) {
    val = !val;
    select_check(val);
  }
}

import 'package:get/get.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';

class Campaign_view_controller extends GetxController {
  RxBool person_alive_status = true.obs;
  RxString contact_mode_contact_by_text_feild = RxString("");
  RxString contact_mode_comments_text_feild = RxString("");
  RxBool contact_mode_change_text_field = false.obs;
  RxString contact_mode_dropdown_value = "--Select--".obs;
  RxBool non_local_check_box = false.obs;
  RxString non_local_check_box_text_feild = RxString("");
  RxBool influencer_check_box = false.obs;
  RxString influencer_check_box_text_feild = RxString("");
  RxBool dissident_check_box = false.obs;
  RxString dissident_check_box_information_given_by_person_text_feild =
      RxString("");
  RxString dissident_check_box_comments_text_feild = RxString("");
  RxBool interested_to_join_party_check_box = false.obs;
  RxString
      interested_to_join_party_check_box_information_given_by_person_text_feild =
      RxString("");
  RxString interested_to_join_party_check_box_comments_text_feild =
      RxString("");
  RxBool physically_challenged = false.obs;
  RxBool deleted = false.obs;
  RxBool duplicate = false.obs;
  RxBool isvoted = false.obs;
  RxList schemes = RxList([]);

  TextFieldWrapper caste = TextFieldWrapper();
  TextFieldWrapper profession_names = TextFieldWrapper();
  TextFieldWrapper contact_number = TextFieldWrapper();
  TextFieldWrapper party_inclination = TextFieldWrapper();
  TextFieldWrapper contact_mode = TextFieldWrapper();
  TextFieldWrapper strength = TextFieldWrapper();
  TextFieldWrapper weakness = TextFieldWrapper();
  TextFieldWrapper contact_mode_contact_by = TextFieldWrapper();
  TextFieldWrapper contact_mode_comments = TextFieldWrapper();
  TextFieldWrapper non_local_address = TextFieldWrapper();
  TextFieldWrapper influencer = TextFieldWrapper();
  TextFieldWrapper dissident = TextFieldWrapper();
  TextFieldWrapper dissident_comments = TextFieldWrapper();
  TextFieldWrapper interested_to_join_party = TextFieldWrapper();
  TextFieldWrapper interested_to_join_party_comments = TextFieldWrapper();
  TextFieldWrapper habitation_names = TextFieldWrapper();
  TextFieldWrapper scheme_names = TextFieldWrapper();

  void Person_Alive_Status(bool val) {
    person_alive_status.value = val;
  }

  Contact_Mode_Change_Text_Field(bool val) {
    contact_mode_change_text_field.value = val;
  }

  Contact_Mode_Dropdown_Value(String value) {
    contact_mode_dropdown_value.value = value;
    value == 'TeamContacted'
        ? Contact_Mode_Change_Text_Field(true)
        : Contact_Mode_Change_Text_Field(false);
  }

  void Reset_Page() {
    caste.controller.text = "";
    profession_names.controller.text = "";
    contact_number.controller.text = "";
    party_inclination.controller.text = "";
    strength.controller.text = "";
    weakness.controller.text = "";
    contact_mode.controller.text = "";
    contact_mode_contact_by.controller.text = "";
    contact_mode_comments.controller.text = "";
    non_local_check_box.value = false;
    non_local_address.controller.text = "";
    influencer_check_box.value = false;
    influencer.controller.text = "";
    dissident_check_box.value = false;
    dissident.controller.text = "";
    dissident_comments.controller.text = "";
    interested_to_join_party_check_box.value = false;
    interested_to_join_party.controller.text = "";
    interested_to_join_party_comments.controller.text = "";
    physically_challenged.value = false;
    deleted.value = false;
    duplicate.value = false;
    isvoted.value = false;
    habitation_names.controller.text = "";
    scheme_names.controller.text = "";
  }
}

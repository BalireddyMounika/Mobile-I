import 'package:get/get.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';

import '../../../../base/base_controller.dart';
import '../../../data/repository/analytic_repository.dart';
import '../../../routes/app_routes.dart';


class Data_analytic_search_screen_controller extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  TextFieldWrapper constituency = TextFieldWrapper();
  TextFieldWrapper pollingstationnames = TextFieldWrapper();
  TextFieldWrapper name = TextFieldWrapper();
  TextFieldWrapper sectionnameandnumber = TextFieldWrapper();

  RxString gender = RxString('');

  RxList<String> polingStationList = RxList();
  RxList<String> sectionNameAndNumberList = RxList();

  List pages = [
    Routes.HOME,
    Routes.DATA_ANALYTICS_SEARCH,
    Routes.ADVANCE_DATA_ANALYTICS_SEARCH
  ];

  void genderfunction(String value) async {
    gender.value = value;
  }

  void changepage(int index) {
    Get.toNamed(pages[index]);
  }
}

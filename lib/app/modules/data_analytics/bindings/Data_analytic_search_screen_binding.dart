import 'package:get/get.dart';

import '../controllers/data_analytics_search_controller.dart';

class Data_analytic_search_screen_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Data_analytic_search_screen_controller());
  }
}

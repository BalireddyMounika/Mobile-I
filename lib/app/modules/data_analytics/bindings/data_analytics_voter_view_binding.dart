import 'package:get/get.dart';

import '../controllers/data_analytics_voter_view_controller.dart';

class data_analytics_voter_view_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => data_analytics_voter_view_controller());
  }
}
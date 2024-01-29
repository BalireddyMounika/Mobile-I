import 'package:get/get.dart';

import '../controllers/apply_filter_page_controller.dart';

class filter_view_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => filter_view_controller());
  }
}

import 'package:get/get.dart';

import '../controllers/edit_view_controller.dart';


class Edit_view_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Edit_view_controller());
  }
}

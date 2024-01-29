import 'package:get/get.dart';

import '../controllers/communication_filter_view_controller.dart';

class CommunicationFilterViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunicationFilterViewController());
  }
}

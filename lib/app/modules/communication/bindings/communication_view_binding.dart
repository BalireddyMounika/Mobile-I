import 'package:get/get.dart';

import '../controllers/communication_view_controller.dart';

class CommunicationViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunicationViewController());
  }
}

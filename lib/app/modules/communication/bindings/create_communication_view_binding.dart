import 'package:get/get.dart';

import '../controllers/create_communication_view_controller.dart';

class CreateCommunicationViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateCommunicationViewController());
  }
}

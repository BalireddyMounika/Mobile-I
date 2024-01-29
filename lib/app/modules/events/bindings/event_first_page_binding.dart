import 'package:get/get.dart';

import '../controllers/event_controller.dart';

class EventFirstPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsController());
  }
}

import 'package:get/get.dart';

import '../controllers/event_controller.dart';

class EventCreatePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsController());
  }
}

import 'package:get/get.dart';

import '../controllers/event_controller.dart';

class EventPlanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsController());
  }
}

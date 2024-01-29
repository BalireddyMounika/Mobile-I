import 'package:get/get.dart';

import '../controllers/event_controller.dart';

class EventSchedulePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventsController());
  }
}

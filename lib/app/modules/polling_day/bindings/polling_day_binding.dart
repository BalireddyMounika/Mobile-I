import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/polling_day_view_controller.dart';

class PollingDayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PollingDayViewController());
  }
}

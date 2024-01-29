import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/inside_outside_controller.dart';

class InsideOutsideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InsideOutsideController());
  }
}

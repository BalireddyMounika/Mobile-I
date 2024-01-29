import 'package:get/get.dart';
import '../controllers/sent_view_controller.dart';

class SentViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SentViewController());
  }
}

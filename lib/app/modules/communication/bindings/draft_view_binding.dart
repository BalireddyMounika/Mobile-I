import 'package:get/get.dart';
import '../controllers/draft_controller.dart';

class DraftViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DraftViewController());
  }
}

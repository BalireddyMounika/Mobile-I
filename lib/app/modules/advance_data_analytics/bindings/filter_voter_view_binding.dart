import 'package:get/get.dart';

import '../controllers/filter_voter_view_controller.dart';

class filter_voter_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterVoterController());
  }
}

import 'package:get/get.dart';

import '../controllers/update_voter_controller.dart';

class UpdateVoterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateVoterCardController());
  }
}

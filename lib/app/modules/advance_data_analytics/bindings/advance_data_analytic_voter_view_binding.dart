import 'package:get/get.dart';

import '../controllers/advance_data_analytic_voter_view_controller.dart';

class Advance_data_analytic_voter_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Advance_data_analytic_voter_controller());
  }
}

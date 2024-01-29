import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/login/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

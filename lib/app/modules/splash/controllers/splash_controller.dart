import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    onBoarding();
    super.onInit();
  }

  void onBoarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (AppStorage.isUserExists()) {
      Get.offAndToNamed(Routes.POLLING_DAY_PAGE);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}

import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/data_analytics/controllers/campaign_view_controller.dart';


class Campaign_view_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Campaign_view_controller());
  }
}

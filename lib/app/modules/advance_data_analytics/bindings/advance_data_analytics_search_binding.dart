import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/controllers/advance_data_analytics_search_controller.dart';

class Advance_data_analytic_search_screen_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdvanceDataAnalyticSearchController());
  }
}

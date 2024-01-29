import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/controllers/quick_insight_controller.dart';

class QuickInsightBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(QuickInsightController());
  }
}

import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/controllers/campaign_controller.dart';

class CampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SingleCardCampaignController());
  }
}

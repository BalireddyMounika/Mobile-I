import 'package:get/get.dart';

import '../controllers/bulk_edit_campaign_details_controller.dart';

class Bulk_edit_campaign_details_binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BulkCardCampaignController());
  }
}

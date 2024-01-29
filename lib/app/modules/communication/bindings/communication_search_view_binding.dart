import 'package:get/get.dart';

import '../controllers/communication_search_view_controller.dart';

class CommunicationSearchViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunicationSearchViewController());
  }
}

import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/network/network_requester.dart';
import 'package:prasada_political_portfolio/app/data/repository/analytic_repository.dart';
import 'package:prasada_political_portfolio/app/data/repository/auth_repository.dart';

import 'package:prasada_political_portfolio/app/data/repository/communication_repository.dart';
import 'package:prasada_political_portfolio/app/data/repository/polling_day_repository.dart';

import 'package:prasada_political_portfolio/app/data/repository/profile_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.put(NetworkRequester(), permanent: true);
    Get.put(AuthRepository(), permanent: true);
    Get.put(AnalyticRepository(), permanent: true);

    Get.put(CommunicationRepository(), permanent: true);

    Get.put(ProfileRepository(), permanent: true);

    Get.put(PollingStationRepository(), permanent: true);
  }
}

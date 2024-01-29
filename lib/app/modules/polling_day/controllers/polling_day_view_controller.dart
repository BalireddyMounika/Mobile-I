import 'dart:async';

import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/repository/polling_day_repository.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/base/base_controller.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';

class PollingDayViewController
    extends BaseController<PollingStationRepository> {
  RxString userEmail = AppStorage.getUser().email.toString().obs;
  RxBool isLoadingData = RxBool(false);
  RxList pollingStationList = [].obs;
  RxString allPollingNames = "".obs;
  RxString selectedPollingStation = "".obs;

  @override
  void onInit() {
    allStationsNameNumIncharge.clear();
    getAllpollingStationDetails();
    // getPollingStationDetails(AppStorage.getUser().email ?? '');

    super.onInit();
  }

  // Future<void> getPollingStationDetails(String user) async {
  //   isLoadingData.value = true;
  //   RepoResponse<GenericResponse> pollingStationResponse =
  //       await repository.getResponseData(
  //     url: URLs.pollingStations,
  //     token: AppStorage.getUser().bearerToken ?? '',
  //     stationName: user,
  //   );
  //   if (pollingStationResponse.data?.status == 200 ||
  //       pollingStationResponse.data?.status == 201) {
  //     isLoadingData.value = false;
  //     List pollingStationData = pollingStationResponse.data?.result as List;
  //     pollingStationList.clear();
  //     for (var e in pollingStationData) {
  //       pollingStationList.add(e['Polling_Station_Name_Num']);
  //     }
  //     pollingStationList.refresh();
  //     allPollingNames.value = pollingStationList.join(',');

  //     if (allPollingNames.value != "") {
  //       getAllpollingStationDetails();
  //     }
  //   } else {
  //     isLoadingData.value = false;
  //     AppUtils.showSnackBar(
  //         pollingStationResponse.error?.message ?? 'something went wrong');
  //   }
  // }

// Api

  RxList allStationsNameNumIncharge = [].obs;
  Future<void> getAllpollingStationDetails() async {
    allStationsNameNumIncharge.clear();
    isLoadingData.value = true;
    RepoResponse<GenericResponse> response = await repository.getResponseData(
      token: AppStorage.getUser().bearerToken ?? '',
      url: URLs.getAllStationDetailsAtOnce,
      stationName: userEmail.value,
    );

    if (response.data?.status == 200 || response.data?.status == 201) {
      isLoadingData.value = false;
      var data = response.data?.result;
      for (var i in data) {
        allStationsNameNumIncharge.add(i);
        pollingStationList.add(i['PollingStation']);
      }
    }

    isLoadingData.value = false;
    allStationsNameNumIncharge.refresh();
    allStationsNameNumIncharge.reactive;
    print(allStationsNameNumIncharge);
  }
}

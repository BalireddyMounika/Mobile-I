import 'dart:async';

// import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
// import 'package:prasada_political_portfolio/app/data/model/resuest/Device_ID_Address_Module.dart';
import 'package:prasada_political_portfolio/app/data/repository/polling_day_repository.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
// import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/base/base_controller.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
// import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';
// import 'package:geolocator/geolocator.dart';

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

    getPollingStationDetails(AppStorage.getUser().email ?? '');

    // showAndroidInfo() ?? showAppleDeviceID();
    // getUserLocation();

    super.onInit();
  }

  Future<void> getPollingStationDetails(String user) async {
    isLoadingData.value = true;
    RepoResponse<GenericResponse> pollingStationResponse = await repository
        .getResponseData(url: URLs.pollingStations, stationName: user);
    if (pollingStationResponse.data?.status == 200 ||
        pollingStationResponse.data?.status == 201) {
      isLoadingData.value = false;
      List pollingStationData = pollingStationResponse.data?.result as List;
      pollingStationList.clear();
      for (var e in pollingStationData) {
        pollingStationList.add(e['Polling_Station_Name_Num']);
      }
      pollingStationList.refresh();
      allPollingNames.value = pollingStationList.join(',');

      if (allPollingNames.value != "") {
        getAllpollingStationDetails();
      }
    } else {
      isLoadingData.value = false;
      AppUtils.showSnackBar(
          pollingStationResponse.error?.message ?? 'something went wrong');
    }
  }

  // RxString latitude = "".obs;
  // RxString longitude = "".obs;

  // void getUserLocation() async {
  //   LocationPermission allowPermission = await Geolocator.requestPermission();

  //   LocationPermission permission = await Geolocator.checkPermission();

  //   if (permission == LocationPermission.denied ||
  //       permission == LocationPermission.deniedForever) {
  //     allowPermission = await Geolocator.requestPermission();
  //   } else {
  //     Position currentPosition = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //     latitude.value = currentPosition.latitude.toString();
  //     longitude.value = currentPosition.longitude.toString();
  //   }
  //   print("------------------");
  //   print(latitude);
  //   print(longitude);
  //   print("------------------");
  // }

  // void updateDeviceIdAddress(
  //   String stationName,
  // ) async {
  //   DeviceIDAddressModule requestData = DeviceIDAddressModule(
  //       deviceId: deviceIDs.value,
  //       iPAddress: "latitude : $latitude , longitude : $longitude");
  //   try {
  //     RepoResponse<GenericResponse> response = await repository.updateIdAddress(
  //         stationName: stationName, requestData: requestData);

  //     if (response.data?.status == 200 || response.data?.status == 201) {
  //       print(response.data.toString());
  //       print("success");
  //     } else {
  //       LoadingUtils.hideLoader();
  //       AppUtils.showSnackBar(response.error?.message ??
  //           response.data?.message ??
  //           'Something went wrong');
  //     }
  //   } catch (e) {
  //     if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
  //     print("-----------ERROR");
  //   } finally {
  //     if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
  //   }
  // }

  // onSubmit() {
  //   if (pollingStationList.isNotEmpty || deviceIDs != "") {
  //     for (var i in pollingStationList) {
  //       updateDeviceIdAddress(i);
  //     }
  //     Get.toNamed(Routes.INSIDE_OUTSIDE_VIEW);
  //   } else {
  //     print("Not Submitted");
  //   }
  // }

  // Get Device info

  // RxString deviceIDs = "".obs;

  // DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

//   Future<String?> getAndroidDeviceId() async {
//     try {
//       AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
//       return info.id;
//     } catch (e) {
//       print("Error getting device ID: $e");
//       return null;
//     }
//   }

// // Example usage:
//   showAndroidInfo() async {
//     String? deviceId = await getAndroidDeviceId();

//     if (deviceId != null) {
//       deviceIDs.value = deviceId;
//     } else {
//       print("Failed to retrieve device ID.");
//     }
//   }

//   Future<String?> getAppleDeviceId() async {
//     try {
//       IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
//       return info.identifierForVendor;
//     } catch (e) {
//       print("Error getting Apple device ID: $e");
//       return null;
//     }
//   }

// // Example usage:
//   showAppleDeviceID() async {
//     String? deviceId = await getAppleDeviceId();

//     if (deviceId != null) {
//       deviceIDs.value = deviceId;
//     } else {
//       print("Failed to retrieve Apple device ID.");
//     }
//   }

// Api

  RxList allStationsNameNumIncharge = [].obs;
  Future<void> getAllpollingStationDetails() async {
    allStationsNameNumIncharge.clear();
    isLoadingData.value = true;
    RepoResponse<GenericResponse> response = await repository.getResponseData(
        url: URLs.getAllStationDetailsAtOnce, stationName: userEmail.value);

    if (response.data?.status == 200 || response.data?.status == 201) {
      isLoadingData.value = false;
      var data = response.data?.result;
      for (var i in data) {
        allStationsNameNumIncharge.add(i);
      }
    }

    isLoadingData.value = false;
    allStationsNameNumIncharge.refresh();
    allStationsNameNumIncharge.reactive;
    print(allStationsNameNumIncharge);
  }
}

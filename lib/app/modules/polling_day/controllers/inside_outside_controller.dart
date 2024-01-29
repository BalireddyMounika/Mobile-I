import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/inside_vote_model.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/outside_vote_model.dart';
import 'package:prasada_political_portfolio/app/data/repository/polling_day_repository.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/polling_day_view_controller.dart';
import 'package:prasada_political_portfolio/base/base_controller.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';
import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';

class InsideOutsideController extends BaseController<PollingStationRepository> {
  final PollingDayViewController pollingDayViewController =
      Get.find<PollingDayViewController>();

  final ScrollController scrollController = ScrollController();

  TextFieldWrapper pollingStations = TextFieldWrapper();

  RxList<String> dropDownList = <String>[].obs;

  RxBool isSwitchStatus = false.obs;
  RxBool isLoading = false.obs;

  RxString selected = "".obs;

  @override
  void onInit() {
    super.onInit();
    selected.value = "";
    if (Get.arguments != null) {
      // selected.value = Get.arguments;
      // pollingStations.controller.text = Get.arguments;
      setSelected(Get.arguments);
    }
    generateDropDownList();
  }

  // Switch Controllers

  onSwitchSelect() {
    isSwitchStatus.toggle();
  }

  // DropDown

  setSelected(String value) async {
    selected.value = value;
    outsideMarkedVotersList.clear();
    outsideUnMarkedVotersList.clear();
    votersSerialNumbers.clear();
    noofMarkedVotes.value = 0;
    noofVotes.value = 0;

    pollingStations.controller.text = selected.value;
    if (votersSerialNumbers.isNotEmpty) {
      scrollController.jumpTo(0.0);
    }
    try {
      isLoading.value = true;

      await getVoterSerialNumber(selected.value);
      await getNoOfVotes(selected.value);
      await getNoofMarkedVotees(selected.value);
      await getOutsideMarkedPollingData(selected.value);
      await getInsideMarkedPollingData(selected.value);

      isLoading.value = false;
      outsideUnMarkedVotersList.reactive;
      insideUnMarkedVotersList.reactive;
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  generateDropDownList() {
    dropDownList.clear();
    for (var i in pollingDayViewController.pollingStationList) {
      dropDownList.add(i);
    }
  }

  // Api
  // using for inside and outside
  RxList<int> votersSerialNumbers = <int>[].obs;

  Future<void> getVoterSerialNumber(String stationName) async {
    RepoResponse<GenericResponse> votersSerialNumbersResponse =
        await repository.getResponseData(
            url: URLs.getVoterSerialNumber, stationName: stationName);

    if (votersSerialNumbersResponse.data?.status == 200 ||
        votersSerialNumbersResponse.data?.status == 201) {
      var data = votersSerialNumbersResponse.data?.result as List;
      for (var i in data) {
        votersSerialNumbers.add(int.parse(i));
      }
    } else {
      AppUtils.showSnackBar(
          votersSerialNumbersResponse.error?.message ?? 'something went wrong');
    }
    print("VoterSerialNumebr    $votersSerialNumbers");
  }

  RxInt noofVotes = 0.obs;

  // using for inside and outside
  Future<void> getNoOfVotes(stationName) async {
    RepoResponse<GenericResponse> noOfVotesResponse =
        await repository.getResponseData(
            url: URLs.getPollingStationCount, stationName: stationName);

    if (noOfVotesResponse.data?.status == 200 ||
        noOfVotesResponse.data?.status == 201) {
      noofVotes.value = noOfVotesResponse.data?.result['No.Of.Voter'] as int;
      print("GetNoofVores     $noofVotes");
    } else {
      AppUtils.showSnackBar(
          noOfVotesResponse.error?.message ?? 'something went wrong');
    }
  }

  RxInt noofMarkedVotes = 0.obs;
  // using for inside and outside
  Future<void> getNoofMarkedVotees(stationName) async {
    RepoResponse<GenericResponse> noofMarkedVotesResponse = await repository
        .getResponseData(url: URLs.isVotedData, stationName: stationName);

    if (noofMarkedVotesResponse.data?.status == 200 ||
        noofMarkedVotesResponse.data?.status == 201) {
      noofMarkedVotes.value =
          noofMarkedVotesResponse.data?.result["IsVotedCount"] as int;
      print("GEtNoofMarkedVotes      $noofMarkedVotes");
    } else {
      AppUtils.showSnackBar(
          noofMarkedVotesResponse.error?.message ?? 'something went wrong');
    }
  }

  RxList<int> outsideMarkedVotersList = <int>[].obs;
  RxList<int> outsideUnMarkedVotersList = <int>[].obs;

  Future<void> getOutsideMarkedPollingData(stationName) async {
    outsideMarkedVotersList.clear();
    RepoResponse<GenericResponse> outsidePollingDataResponse =
        await repository.getPollingStationData(
            stationURL: URLs.getOutsidePollingData, stationName: stationName);

    if (outsidePollingDataResponse.data?.status == 200 ||
        outsidePollingDataResponse.data?.status == 201) {
      print("dfljdshkcsjddchlsxcjls");
      List data = outsidePollingDataResponse.data?.result as List;
      for (var i in data) {
        outsideMarkedVotersList.add(int.parse(i['Voter_SerialNumber']));
      }
      if (outsideMarkedVotersList.isNotEmpty ||
          outsideMarkedVotersList.isEmpty) {
        outsideUnMarkedVotersList.value = votersSerialNumbers
            .where((element) => !outsideMarkedVotersList.contains(element))
            .toList();
      }
    } else {
      AppUtils.showSnackBar(
          outsidePollingDataResponse.error?.message ?? 'something went wrong');
    }
  }

  void isOutsideUpdated(
      String stationName, int index, bool isOutsideValue) async {
    OutsideVoteModel requestData = OutsideVoteModel(
      outsideVoter: isOutsideValue,
    );
    try {
      RepoResponse<GenericResponse> response = await repository.updateVote(
        stationUrl: URLs.outsideURL,
        id: index,
        stationName: stationName,
        requestData: requestData,
      );
      if (response.data?.status == 200 || response.data?.status == 201) {
        if (isOutsideValue) {
          outsideUnMarkedVotersList.remove(index);
          outsideMarkedVotersList.add(index);
        } else {
          outsideUnMarkedVotersList.add(index);
          outsideMarkedVotersList.remove(index);
        }
        outsideMarkedVotersList.sort();
        outsideUnMarkedVotersList.sort();
        checkInsideOusideMarkedVoted();
        // getVoterSerialNumber(selected.value);
        // getNoOfVotes(selected.value);
        // getNoofMarkedVotees(selected.value);
        // getOutsideMarkedPollingData(selected.value);
      } else {
        LoadingUtils.hideLoader();
        AppUtils.showSnackBar(response.error?.message ??
            response.data?.message ??
            'Something went wrong');
      }
    } catch (e) {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    } finally {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    }
  }

  // Inside Voters

  RxList<int> insideMarkedVotersList = <int>[].obs;
  RxList<int> insideUnMarkedVotersList = <int>[].obs;

  Future<void> getInsideMarkedPollingData(stationName) async {
    insideMarkedVotersList.clear();
    RepoResponse<GenericResponse> insidePollingDataResponse =
        await repository.getPollingStationData(
            stationURL: URLs.getInsidePollingData, stationName: stationName);

    if (insidePollingDataResponse.data?.status == 200 ||
        insidePollingDataResponse.data?.status == 201) {
      List data = insidePollingDataResponse.data?.result as List;
      for (var i in data) {
        insideMarkedVotersList.add(int.parse(i['Voter_SerialNumber']));
      }
      if (insideMarkedVotersList.isNotEmpty || insideMarkedVotersList.isEmpty) {
        insideUnMarkedVotersList.value = votersSerialNumbers
            .where((element) => !insideMarkedVotersList.contains(element))
            .toList();
      }
    } else {
      AppUtils.showSnackBar(
          insidePollingDataResponse.error?.message ?? 'something went wrong');
    }
    print(insidePollingDataResponse.data?.result);
  }

  void isInsideUpdated(
      String stationName, int index, bool isInsideValue) async {
    insideVoteModel requestData = insideVoteModel(
      insideVoter: isInsideValue,
    );
    try {
      RepoResponse<GenericResponse> response = await repository.updateVote(
        stationUrl: URLs.insideURL,
        id: index,
        stationName: stationName,
        requestData: requestData,
      );
      if (response.data?.status == 200 || response.data?.status == 201) {
        if (isInsideValue) {
          insideMarkedVotersList.add(index);
          insideUnMarkedVotersList.remove(index);
        } else {
          insideMarkedVotersList.remove(index);
          insideUnMarkedVotersList.add(index);
        }
        insideMarkedVotersList.sort();
        insideUnMarkedVotersList.sort();
        checkInsideOusideMarkedVoted();
        // getVoterSerialNumber(selected.value);
        // getNoOfVotes(selected.value);
        getNoofMarkedVotees(selected.value);
        // getInsideMarkedPollingData(selected.value);
      } else {
        LoadingUtils.hideLoader();
        AppUtils.showSnackBar(response.error?.message ??
            response.data?.message ??
            'Something went wrong');
      }
    } catch (e) {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    } finally {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    }
  }

  checkInsideOusideMarkedVoted() {
    Set<int> uniqueValues = {
      ...insideMarkedVotersList,
      ...outsideMarkedVotersList
    };
    noofMarkedVotes.value = uniqueValues.length;
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/repository/communication_repository.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';
import '../../../../base/base_controller.dart';
import '../../../../utils/app_utils.dart';
import '../../../../utils/helper/text_field_wrapper.dart';
import '../../../data/model/dto/RepoResponse.dart';
import '../../../data/model/response/generic_response.dart';
import '../../../routes/app_routes.dart';
import 'communication_search_view_controller.dart';

class CommunicationFilterViewController
    extends BaseController<CommunicationRepository> {
  CommunicationSearchViewController controller = Get.find();

  @override
  void onInit() {
    super.onInit();
    getPartyName();
    getHabitationName();
    getSchemeName();
  }

  RxBool casteCheck = false.obs;
  RxBool contactCheck = false.obs;
  RxBool nonLocalAddress = false.obs;
  RxBool dissident = false.obs;
  RxBool interestedToJoinParty = false.obs;
  RxBool physicallyChallenged = false.obs;
  RxBool profession = false.obs;
  RxBool partyInclination = false.obs;
  RxBool contactMode = false.obs;
  RxBool habitations = false.obs;
  RxBool schemes = false.obs;
  TextFieldWrapper casteWrapper = TextFieldWrapper();
  TextFieldWrapper professionWrapper = TextFieldWrapper();
  TextFieldWrapper partyWrapper = TextFieldWrapper();
  TextFieldWrapper contactModeWrapper = TextFieldWrapper();
  TextFieldWrapper habitationWrapper = TextFieldWrapper();
  TextFieldWrapper schemesWrapper = TextFieldWrapper();
  RxBool ageCheck = false.obs;
  RxDouble lowerAge = 18.0.obs;
  RxDouble upperAge = 75.0.obs;
  RxList<String> partyNamesList = RxList();
  RxList<String> habitationNamesList = RxList();
  RxList<String> schemeNamesList = RxList();

  RxString filterDataCount = RxString('');

  final StreamController<RangeValues> _sliderStreamController =
      StreamController<RangeValues>.broadcast();
  Stream<RangeValues> get sliderStream => _sliderStreamController.stream;

  void updateSliderStream(RangeValues values) {
    _sliderStreamController.add(values);
  }

  void updateAgeRange(RangeValues values) {
    lowerAge.value = values.start;
    upperAge.value = values.end;
  }

  Future<void> getPartyName() async {
    RepoResponse<GenericResponse> partyNamesResponse = await repository
        .getPartyNames(token: AppStorage.getUser().bearerToken ?? '');
    if (partyNamesResponse.data?.status == 200 ||
        partyNamesResponse.data?.status == 201) {
      List partyNames = partyNamesResponse.data?.result as List;
      partyNamesList.clear();
      for (var i in partyNames) {
        partyNamesList.add(i["PartyName"]);
      }
      partyNamesList.refresh();
    } else {
      AppUtils.showSnackBar(
          partyNamesResponse.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getHabitationName() async {
    RepoResponse<GenericResponse> habitationNamesResponse = await repository
        .getHabitationNames(token: AppStorage.getUser().bearerToken ?? '');
    if (habitationNamesResponse.data?.status == 200 ||
        habitationNamesResponse.data?.status == 201) {
      List habitationNames = habitationNamesResponse.data?.result as List;
      habitationNamesList.clear();
      for (var i in habitationNames) {
        habitationNamesList.add(i["HabitationName"]);
      }
      habitationNamesList.refresh();
    } else {
      AppUtils.showSnackBar(
          habitationNamesResponse.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getSchemeName() async {
    RepoResponse<GenericResponse> schemeNamesResponse = await repository
        .getSchemeNames(token: AppStorage.getUser().bearerToken ?? '');
    if (schemeNamesResponse.data?.status == 200 ||
        schemeNamesResponse.data?.status == 201) {
      List schemeNames = schemeNamesResponse.data?.result as List;
      schemeNamesList.clear();
      for (var i in schemeNames) {
        schemeNamesList.add(i["SchemeName"]);
      }
      schemeNamesList.refresh();
    } else {
      AppUtils.showSnackBar(
          schemeNamesResponse.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getCommunicationFilter() async {
    RepoResponse<GenericResponse> filterResponse =
        await repository.getCommunicationModuleFilter(
      // ivinIds: controller.ivinIds.isNotEmpty
      //     ? controller.ivinIds.toString()
      //     : "null",
      token: AppStorage.getUser().bearerToken ?? '',
      ivinIds: '1',
      caste: casteWrapper.controller.text.isNotEmpty
          ? casteWrapper.controller.text
          : "null",
      contactNumber: "null",
      partyInclinationId: partyWrapper.controller.text.isNotEmpty
          ? partyWrapper.controller.text
          : "null",
      profession: professionWrapper.controller.text.isNotEmpty
          ? professionWrapper.controller.text
          : "null",
      contactMode: contactModeWrapper.controller.text.isNotEmpty
          ? contactModeWrapper.controller.text
          : "null",
      nonLocalAddress: "null",
      dissident: "null",
      interestedToJoinParty: "null",
      physicallyChallenged: "null",
      habitation: habitationWrapper.controller.text.isNotEmpty
          ? habitationWrapper.controller.text
          : "null",
      fromAge:
          // lowerAge.value.toString().isNotEmpty
          //     ? lowerAge.value.toString() :
          "null",
      toAge:
          // upperAge.value.toString().isNotEmpty
          //     ? upperAge.value.toString() :
          "null",
      schemes: schemesWrapper.controller.text.isNotEmpty
          ? schemesWrapper.controller.text
          : "null",
    );
    if (filterResponse.data?.status == 200 ||
        filterResponse.data?.status == 201) {
      var filterData = filterResponse.data?.result;
      Get.toNamed(Routes.CREATE_COMMUNICATION_VIEW);
      print(filterData);
      // filterDataCount.value = filterData ?? '';
    } else {
      AppUtils.showSnackBar(
          filterResponse.error?.message ?? 'something went wrong');
    }
  }

  void onReset() {
    casteCheck.value = false;
    contactCheck.value = false;
    nonLocalAddress.value = false;
    dissident.value = false;
    interestedToJoinParty.value = false;
    physicallyChallenged.value = false;
    profession.value = false;
    partyInclination.value = false;
    contactMode.value = false;
    habitations.value = false;
    schemes.value = false;
    ageCheck.value = false;
    professionWrapper.controller.text = "";
    partyWrapper.controller.text = "";
    contactModeWrapper.controller.text = "";
    habitationWrapper.controller.text = "";
    schemesWrapper.controller.text = "";
  }
}

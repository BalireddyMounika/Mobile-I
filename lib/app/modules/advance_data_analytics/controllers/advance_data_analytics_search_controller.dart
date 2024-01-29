import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/VoterResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/repository/analytic_repository.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/base/base_controller.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';
import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';
import 'package:prasada_political_portfolio/widgets/common/common_pdf_viewer.dart';

class AdvanceDataAnalyticSearchController
    extends BaseController<AnalyticRepository> {
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;

  TextFieldWrapper constituency = TextFieldWrapper();
  TextFieldWrapper mandal = TextFieldWrapper();
  TextFieldWrapper pollingstationnames = TextFieldWrapper();
  TextFieldWrapper sectionnameandnumber = TextFieldWrapper();
  TextFieldWrapper name = TextFieldWrapper();
  TextFieldWrapper lastname = TextFieldWrapper();
  TextFieldWrapper last_name_like_search = TextFieldWrapper();
  TextFieldWrapper house_no = TextFieldWrapper();
  TextFieldWrapper voter_id = TextFieldWrapper();

  RxString gender = RxString('null');

  RxList<String> mandalList = RxList();
  RxList<String> polingStationList = RxList();
  RxList<String> sectionNameAndNumberList = RxList();
  RxList<VoterResponse> voterDataList = RxList();
  RxList<VoterResponse> familyVoterDataList = RxList();
  RxList<VoterResponse> tempVoterDataList = RxList();
  RxList<VoterResponse> selectedVoterDataList = RxList();
  RxList<int> ivinIdsList = RxList([]);
  RxList<String> filterOptionList =
      RxList(['Caste', 'Contact number', 'Party inclination']);
  RxList<String> selectedFilterOptionList = RxList([]);

  RxBool isSelectAllEnable = RxBool(false);
  RxBool isSelectAllSelected = RxBool(false);
  RxBool isLoadingData = RxBool(false);
  RxBool isLastPage = RxBool(false);
  RxBool imageDownloading = RxBool(false);

  @override
  void onInit() {
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // User has reached the end of the list, load more data
      loadMoreData();
    }
  }

  void loadMoreData() async {
    if (isLoadingData.value) {
      return; // Don't load more data if already loading
    }
    if (!isLastPage.value) {
      isLoadingData.value = true;
      currentPage++;
      getVoterList();
      isLoadingData.value = false;
    }
  }

  void genderfunction(String value) async {
    gender.value = value;
  }

  void resetSearchForm() {
    constituency.controller.text = "";
    mandal.controller.text = "";
    pollingstationnames.controller.text = "";
    sectionnameandnumber.controller.text = "";
    gender.value = "";
    name.controller.text = "";
    lastname.controller.text = "";
    last_name_like_search.controller.text = "";
    house_no.controller.text = "";
    voter_id.controller.text = "";
  }

  Future<void> onSelectConstituency({required String constituencyName}) async {
    if (constituencyName != constituency.controller.text) {
      constituency.controller.text = constituencyName;
      mandal.controller.clear();
      pollingstationnames.controller.clear();
      sectionnameandnumber.controller.clear();
      LoadingUtils.showLoader();
      await getMandal(constituencyName: constituencyName);
    }
    LoadingUtils.hideLoader();
  }

  Future<void> onSelectMandal({required String mandalName}) async {
    if (mandalName != mandal.controller.text) {
      mandal.controller.text = mandalName;
      pollingstationnames.controller.clear();
      sectionnameandnumber.controller.clear();
      LoadingUtils.showLoader();
      await getPolingStation(mandalName: mandalName);
    }
    LoadingUtils.hideLoader();
  }

  Future<void> onSelectPolingStation(
      {required String polingStationNameAndNumber}) async {
    if (polingStationNameAndNumber != pollingstationnames.controller.text) {
      pollingstationnames.controller.text = polingStationNameAndNumber;
      sectionnameandnumber.controller.clear();
      LoadingUtils.showLoader();
      await getSectionNameAndNumber(
          polingStationName: polingStationNameAndNumber);
    }
    LoadingUtils.hideLoader();
  }

  onCheckedSelectAll() {
    isSelectAllSelected.toggle();
    if (isSelectAllSelected.value) {
      selectedVoterDataList.assignAll(tempVoterDataList);
    } else {
      selectedVoterDataList.clear();
    }
    tempVoterDataList.refresh();
  }

  onLongPressVoterCard(VoterResponse voterResponse) {
    selectedVoterDataList.add(voterResponse);
    isSelectAllEnable.toggle();
    tempVoterDataList.refresh();
  }

  onTapVoterCard(VoterResponse voterResponse) {
    if (isSelectAllEnable.value) {
      if (selectedVoterDataList.contains(voterResponse)) {
        selectedVoterDataList.remove(voterResponse);
        isSelectAllSelected.value = false;
      } else {
        selectedVoterDataList.add(voterResponse);
      }
    }
  }

  onSelectFilterOption({required String value}) {
    if (selectedFilterOptionList.contains(value)) {
      selectedFilterOptionList.remove(value);
    } else {
      selectedFilterOptionList.add(value);
    }
    filterOptionList.refresh();
  }

  // onEditSelectedCard({required VoterResponse voterResponse}) {
  //   Get.toNamed
  // }

  Future<void> getPolingStation({required String mandalName}) async {
    RepoResponse<GenericResponse> polingStationResponse =
        await repository.getPolingStation(
            mandalName: mandalName,
            token: AppStorage.getUser().bearerToken ?? '');

    if (polingStationResponse.data?.status == 200 ||
        polingStationResponse.data?.status == 201) {
      List polingStationData = polingStationResponse.data?.result as List;
      polingStationList.clear();
      for (var e in polingStationData) {
        polingStationList.add(e);
      }
      polingStationList.refresh();
    } else {
      AppUtils.showSnackBar(
          polingStationResponse.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getMandal({required String constituencyName}) async {
    RepoResponse<GenericResponse> response = await repository.getManda(
        constituencyName: constituencyName,
        token: AppStorage.getUser().bearerToken ?? '');

    if (response.data?.status == 200 || response.data?.status == 201) {
      List mandalData = response.data?.result as List;
      mandalList.clear();
      for (var e in mandalData) {
        mandalList.add(e);
      }
      mandalList.refresh();
    } else {
      AppUtils.showSnackBar(response.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getSectionNameAndNumber(
      {required String polingStationName}) async {
    RepoResponse<GenericResponse> response =
        await repository.getAllSectionNameAndNumber(
            sectionNameAndNumber: polingStationName,
            token: AppStorage.getUser().bearerToken ?? '');

    if (response.data?.status == 200 || response.data?.status == 201) {
      List sectionData = response.data?.result as List;
      sectionNameAndNumberList.clear();
      for (var e in sectionData) {
        e == null ? print("null") : sectionNameAndNumberList.add(e);
      }
      sectionNameAndNumberList.refresh();
    } else {
      AppUtils.showSnackBar(response.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getVoterList() async {
    if (constituency.controller.text.isNotEmpty &&
        mandal.controller.text.isNotEmpty &&
        pollingstationnames.controller.text.isNotEmpty) {
      LoadingUtils.showLoader();
      RepoResponse<GenericResponse> response =
          await repository.getFilteredVoterData(
        constituency: constituency.controller.text,
        token: AppStorage.getUser().bearerToken ?? '',
        gender: gender.value.isNotEmpty ? gender.value.toUpperCase() : 'null',
        home: house_no.controller.text.isNotEmpty
            ? house_no.controller.text
            : 'null',
        lastName: lastname.controller.text.isNotEmpty
            ? lastname.controller.text
            : 'null',
        mandal: mandal.controller.text,
        name: name.controller.text.isNotEmpty ? name.controller.text : 'null',
        pollingStationName: pollingstationnames.controller.text,
        sectionName: sectionnameandnumber.controller.text.isNotEmpty
            ? sectionnameandnumber.controller.text
            : 'null',
        voterId: voter_id.controller.text.isNotEmpty
            ? voter_id.controller.text
            : 'null',
        // page: currentPage.toString(),
        // perPage: '50',
        cast: selectedFilterOptionList.contains('Cast').toString(),
        contactNumber:
            selectedFilterOptionList.contains('Contact number').toString(),
        // partyInclination:
        //     selectedFilterOptionList.contains('Party inclination').toString(),
      );
      LoadingUtils.hideLoader();
      if (response.data?.status == 200 || response.data?.status == 201) {
        var voterData = response.data?.result as List;
        voterDataList.clear();
        tempVoterDataList.clear();
        for (var e in voterData) {
          voterDataList.add(VoterResponse.fromJson(e));
        }
        for (var e in voterDataList) {
          ivinIdsList.add(e.ivinId ?? 0);
        }
        tempVoterDataList.assignAll(voterDataList);
        voterDataList.refresh();
        Get.toNamed(Routes.ADVANCE_DATA_ANALYTICS_VOTER_VIEW);
        resetSearchForm();
      } else {
        AppUtils.showSnackBar(
            response.error?.message ?? 'something went wrong');
      }
    } else {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      AppUtils.showSnackBar('Please fill details');
    }
  }

  void getFilterVoterList() {
    tempVoterDataList.clear();

    voterDataList.forEach((element) {
      bool hasCaste = element.caste != null;
      bool hasContactNumber = element.contactNumber != null;
      bool hasPartyInclination = element.partyInclinationId != null;

      if (selectedFilterOptionList.isNotEmpty) {
        if (selectedFilterOptionList.contains("Caste") &&
            selectedFilterOptionList.contains("Contact number") &&
            selectedFilterOptionList.contains("Party inclination")) {
          if (hasCaste && hasContactNumber && hasPartyInclination) {
            tempVoterDataList.add(element);
          }
        } else if (selectedFilterOptionList.contains("Caste") &&
            selectedFilterOptionList.contains("Contact number")) {
          if (hasCaste && hasContactNumber) {
            tempVoterDataList.add(element);
          }
        } else if (selectedFilterOptionList.contains("Caste") &&
            selectedFilterOptionList.contains("Party inclination")) {
          if (hasCaste && hasPartyInclination) {
            tempVoterDataList.add(element);
          }
        } else if (selectedFilterOptionList.contains("Contact number") &&
            selectedFilterOptionList.contains("Party inclination")) {
          if (hasContactNumber && hasPartyInclination) {
            tempVoterDataList.add(element);
          }
        } else if (selectedFilterOptionList.contains("Caste")) {
          if (hasCaste) {
            tempVoterDataList.add(element);
          }
        } else if (selectedFilterOptionList.contains("Contact number")) {
          if (hasContactNumber) {
            tempVoterDataList.add(element);
          }
        } else if (selectedFilterOptionList.contains("Party inclination")) {
          if (hasPartyInclination) {
            tempVoterDataList.add(element);
          }
        }
      } else {
        tempVoterDataList.add(element);
      }
    });
  }

  Future<void> getFamilyVoterList() async {
    VoterResponse data = selectedVoterDataList.first;
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response =
        await repository.getFamilyVoterData(
            constituency: data.constituency?.isNotEmpty ?? false
                ? data.constituency ?? ''
                : 'null',
            token: AppStorage.getUser().bearerToken ?? '',
            gender: 'null',
            home: data.home?.isNotEmpty ?? false ? data.home ?? '' : 'null',
            lastName: 'null',
            mandal:
                data.mandal?.isNotEmpty ?? false ? data.mandal ?? '' : 'null',
            name: 'null',
            pollingStationName: data.pollingStationName?.isNotEmpty ?? false
                ? data.pollingStationName?.split('-').first ?? ''
                : 'null',
            sectionName: 'null',
            voterId: 'null',
            cast: 'null',
            contactNumber: 'null',
            guardian: 'null');
    LoadingUtils.hideLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      var voterData = response.data?.result as List;
      familyVoterDataList.clear();
      for (var e in voterData) {
        familyVoterDataList.add(VoterResponse.fromJson(e));
      }
      familyVoterDataList.refresh();
      Get.toNamed(Routes.RELATION_VOTER_VIEW);
    } else {
      AppUtils.showSnackBar(response.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getVoterSlipUrl() async {
    String firstPart = selectedVoterDataList.first.voterSlip!.split('-').last;
    int lastIndexOf = firstPart.lastIndexOf(".pdf");
    String finalName = firstPart.substring(0, lastIndexOf);

    RepoResponse<GenericResponse> response = await repository.getVoterProof(
        folderName: 'pdf_data',
        imageName: finalName + '.pdf',
        token: AppStorage.getUser().bearerToken ?? '');
    if (response.data?.status == 200 || response.data?.status == 201) {
      if (response.data?.result != null && response.data?.result != '') {
        downloadInvoiceReport(response.data?.result);
      }
    } else {}
  }

  void downloadInvoiceReport(String url) async {
    String path = url;
    log(path);
    try {
      AppUtils.showSnackBar('fetching voter data');
      var response = await repository.downloadAttachmentFile(url: url);
      log(response.toString());
      if (response != null) {
        Get.to(
          () => CommonPdfViewer(
            file: response,
            fileName: 'voter slip',
          ),
        );
      }
    } catch (e) {
      log(e.toString());
      AppUtils.showSnackBar('Something went wrong');
    }
  }

  reset() {
    isSelectAllEnable.value = false;
    isSelectAllSelected.value = false;
    isLastPage = RxBool(false);
    currentPage = 1;
    selectedVoterDataList.clear();
    selectedFilterOptionList.clear();
  }
}

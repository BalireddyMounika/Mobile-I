import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/FinalIvinDataAnalytics.dart';
import 'package:prasada_political_portfolio/app/data/model/response/QuickInsightResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/QuickInsightSearchResult.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/SaveInsightsRequest.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/search_quick_analytics_request.dart';
import 'package:prasada_political_portfolio/app/data/repository/analytic_repository.dart';
import 'package:prasada_political_portfolio/app/data/repository/quick_insight_repository.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/base/base_controller.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';
import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';

class QuickInsightController extends BaseController {
  QuickInsightRepository quickInsighrrepository = QuickInsightRepository();
  AnalyticRepository analyticRepository = AnalyticRepository();

  final ScrollController scrollController = ScrollController();
  bool isLoadingMore = false; // Flag to track if more data is being loaded
  bool isLastPage = false; // Flag to track if more data is being loaded

  int currentPage = 1;
  int pageSize = 20;

  Rx<RangeValues> ageRangeValues = const RangeValues(18, 100).obs;

  RxList<QuickInsightResponse> quickInsightList = RxList();
  RxList<QuickInsightResponse> selectedQuickInsightList = RxList();

  RxList<String> filterList = [
    "Cast",
    "Number",
    "Profession",
    "Party inclination",
    "Contact mode",
    "Non local Address",
    "Dissident",
    "Influenced",
    "Interested to join Party",
    "Physically challenged",
    "Habitations",
    "Schemes",
  ].obs;

  RxList selectedFilter = RxList([]);

  TextFieldWrapper constituency = TextFieldWrapper();
  TextFieldWrapper mandal = TextFieldWrapper();
  TextFieldWrapper pollingstationnames = TextFieldWrapper();
  TextFieldWrapper sectionNameAndnumber = TextFieldWrapper();
  TextFieldWrapper name = TextFieldWrapper();
  TextFieldWrapper lastname = TextFieldWrapper();
  TextFieldWrapper lastNameLikeSearch = TextFieldWrapper();
  TextFieldWrapper house_no = TextFieldWrapper();
  TextFieldWrapper voter_id = TextFieldWrapper();
  TextFieldWrapper nameOfYourQuickInsights = TextFieldWrapper();
  TextFieldWrapper description = TextFieldWrapper();

  RxList<String> mandalList = RxList();
  RxList<String> polingStationList = RxList();
  RxList<String> sectionNameAndNumberList = RxList();
  RxList<FinalIvinDataAnalytics> voterDataList = RxList();

  // RxBool isMaleSelected = RxBool(true);
  RxString selectedGender = RxString('');

  final formKey = GlobalKey<FormState>();
  final saveInsightFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getAllInsights();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // User has reached the end of the list, load more data
        if (!isLoadingMore) {
          isLoadingMore = true;
          loadMoreInsights();
        }
      }
    });
  }

  Future<void> loadMoreInsights() async {
    if (!isLastPage) {
      currentPage++; // Increment the page number
      RepoResponse<GenericResponse> response =
          await quickInsighrrepository.getAllQuickInsights(
              token: AppStorage.getUser().bearerToken ?? '',
              page: currentPage.toString(),
              pageSize: pageSize.toString());
      if (response.data?.status == 200 || response.data?.status == 201) {
        var data = response.data?.result as List;
        for (var element in data) {
          quickInsightList.add(QuickInsightResponse.fromJson(element));
        }
      } else {
        isLastPage = true;
        AppUtils.showSnackBar(response.error?.message ??
            response.data?.message ??
            "Something went wrong");
      }
      isLoadingMore = false;
    } else {
      AppUtils.showSnackBar('No more data');
    }
  }

  Future<void> getAllInsights() async {
    RepoResponse<GenericResponse> response =
        await quickInsighrrepository.getAllQuickInsights(
            page: '1',
            pageSize: '20',
            token: AppStorage.getUser().bearerToken ?? '');
    if (response.data?.status == 200 || response.data?.status == 201) {
      var data = response.data?.result as List;
      for (var element in data) {
        quickInsightList.add(QuickInsightResponse.fromJson(element));
      }
    } else {
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'Something went wrong');
    }
  }

  Future<void> onSelectConstituency({required String constituencyName}) async {
    if (constituencyName != constituency.controller.text) {
      constituency.controller.text = constituencyName;
      mandal.controller.clear();
      pollingstationnames.controller.clear();
      sectionNameAndnumber.controller.clear();
      LoadingUtils.showLoader();
      await getMandal(constituencyName: constituencyName);
      LoadingUtils.hideLoader();
    }
  }

  Future<void> onSelectMandal({required String mandalName}) async {
    if (mandalName != mandal.controller.text) {
      mandal.controller.text = mandalName;
      pollingstationnames.controller.clear();
      sectionNameAndnumber.controller.clear();
      LoadingUtils.showLoader();
      await getPolingStation(mandalName: mandalName);
      LoadingUtils.hideLoader();
    }
  }

  Future<void> onSelectPolingStation(
      {required String polingStationNameAndNumber}) async {
    if (polingStationNameAndNumber != pollingstationnames.controller.text) {
      pollingstationnames.controller.text = polingStationNameAndNumber;
      sectionNameAndnumber.controller.clear();
      LoadingUtils.showLoader();
      await getSectionNameAndNumber(
          polingStationName: polingStationNameAndNumber);
      LoadingUtils.hideLoader();
    }
  }

  Future<void> getPolingStation({required String mandalName}) async {
    RepoResponse<GenericResponse> polingStationResponse =
        await analyticRepository.getPolingStation(
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
    RepoResponse<GenericResponse> response = await analyticRepository.getManda(
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
        await analyticRepository.getAllSectionNameAndNumber(
            sectionNameAndNumber: polingStationName,
            token: AppStorage.getUser().bearerToken ?? '');

    if (response.data?.status == 200 || response.data?.status == 201) {
      List sectionData = response.data?.result as List;
      sectionNameAndNumberList.clear();
      for (var e in sectionData) {
        sectionNameAndNumberList.add(e);
      }
      sectionNameAndNumberList.refresh();
    } else {
      AppUtils.showSnackBar(response.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getFilteredInsightData(
      {void Function(bool success)? callback}) async {
    SearchQuickAnalyticsRequest requestData = SearchQuickAnalyticsRequest(
      constituency: constituency.controller.text,
      gender: selectedGender.value != ''
          ? selectedGender.value.toUpperCase()
          : 'null',
      home: house_no.controller.text.isNotEmpty
          ? house_no.controller.text
          : 'null',
      lastName: lastname.controller.text.isNotEmpty
          ? lastname.controller.text
          : 'null',
      lastnameLike: lastNameLikeSearch.controller.text.isNotEmpty
          ? lastNameLikeSearch.controller.text
          : 'null',
      mandal: mandal.controller.text,
      name: name.controller.text.isNotEmpty ? name.controller.text : 'null',
      pollingStationName: pollingstationnames.controller.text,
      sectionNoAndName: sectionNameAndnumber.controller.text,
      contactMode: 'null',
      caste: selectedFilter.contains('Cast') ? 'yes' : 'null',
      contactNumber: selectedFilter.contains('Number') ? 'yes' : 'null',
      partyInclinationId:
          selectedFilter.contains('Party inclination') ? 'yes' : 'null',
      profession: selectedFilter.contains('Profession') ? 'yes' : 'null',
      nonLocalAddress:
          selectedFilter.contains('Non local Address') ? 'yes' : 'null',
      dissident: selectedFilter.contains('Dissident') ? 'yes' : 'null',
      interestToJoinParty:
          selectedFilter.contains('Interested to join Party') ? 'yes' : 'null',
      physicallyChallenged:
          selectedFilter.contains('Physically challenged') ? 'yes' : 'null',
      habitationsId: selectedFilter.contains('Habitations') ? 'yes' : 'null',
      fromAge: ageRangeValues.value.start.toInt().toString(),
      toAge: ageRangeValues.value.end.toInt().toString(),
      schemes: selectedFilter.contains('Schemes') ? 'yes' : 'null',
      page: 1,
      perPage: 10,
    );
    try {
      if (formKey.currentState!.validate()) {
        LoadingUtils.showLoader();
        RepoResponse<GenericResponse> response =
            await quickInsighrrepository.getQuickSearchAnalyticsData(
                token: AppStorage.getUser().bearerToken ?? '',
                requestData: requestData);

        if (response.data?.status == 200 || response.data?.status == 201) {
          LoadingUtils.hideLoader();
          QuickInsightSearchResult quickInsightSearchResult =
              QuickInsightSearchResult.fromJson(response.data?.result);
          voterDataList.clear();
          voterDataList.value =
              quickInsightSearchResult.finalIvinDataAnalytics ?? [];
          voterDataList.refresh();
          callback?.call(true);
        } else {
          LoadingUtils.hideLoader();
          callback?.call(false);
          AppUtils.showSnackBar(response.error?.message ??
              response.data?.message ??
              'something went wrong');
        }
      }
    } catch (e) {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      print(e);
    } finally {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    }
  }

  Future<void> saveSearchQuickInsights() async {
    SaveInsightsRequest requestData = SaveInsightsRequest(
        constituency: constituency.controller.text,
        gender: selectedGender.toUpperCase(),
        home: house_no.controller.text.isNotEmpty
            ? house_no.controller.text
            : 'null',
        lastName: lastname.controller.text.isNotEmpty
            ? lastname.controller.text
            : 'null',
        lastnameLike: lastNameLikeSearch.controller.text.isNotEmpty
            ? lastNameLikeSearch.controller.text
            : 'py',
        mandal: mandal.controller.text,
        name: name.controller.text.isNotEmpty ? name.controller.text : 'null',
        pollingStationName: pollingstationnames.controller.text,
        sectionNoAndName: sectionNameAndnumber.controller.text,
        contactMode: 'null',
        caste: selectedFilter.contains('Cast') ? 'yes' : 'null',
        contactNumber: selectedFilter.contains('Number') ? 'yes' : 'null',
        partyInclinationId:
            selectedFilter.contains('Party inclination') ? 'yes' : 'null',
        profession: selectedFilter.contains('Profession') ? 'yes' : 'null',
        nonLocalAddress:
            selectedFilter.contains('Non local Address') ? 'yes' : 'null',
        dissident: selectedFilter.contains('Dissident') ? 'yes' : 'null',
        interestToJoinParty: selectedFilter.contains('Interested to join Party')
            ? 'yes'
            : 'null',
        physicallyChallenged:
            selectedFilter.contains('Physically challenged') ? 'yes' : 'null',
        habitationsId: selectedFilter.contains('Habitations') ? 'yes' : 'null',
        fromAge: ageRangeValues.value.start.toInt().toString(),
        toAge: ageRangeValues.value.end.toInt().toString(),
        // schemes: selectedFilter.contains('Schemes') ? 'yes' : 'null',
        discription: description.controller.text,
        nameOfYourQuickInsights: nameOfYourQuickInsights.controller.text,
        ivinIds: '');
    try {
      LoadingUtils.showLoader();
      RepoResponse<GenericResponse> response =
          await quickInsighrrepository.saveFilterQuickInsight(
              token: AppStorage.getUser().bearerToken ?? '',
              requestData: requestData);
      LoadingUtils.hideLoader();
      if (response.data?.status == 200 || response.data?.status == 201) {
        await getAllInsights();
        Get.offNamed(Routes.QUICK_INSIGHTS);
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

  void onLongPress(QuickInsightResponse insightData) {
    selectedQuickInsightList.add(insightData);
    quickInsightList.refresh();
  }

  void onSelect(QuickInsightResponse insightData) {
    if (selectedQuickInsightList.contains(insightData)) {
      selectedQuickInsightList.remove(insightData);
      quickInsightList.refresh();
    } else {}
  }

  void onUpdate(QuickInsightResponse insightData, int idx) async {
    SaveInsightsRequest requestData = SaveInsightsRequest(
        constituency: insightData.constituency,
        gender: insightData.gender,
        home: insightData.home,
        lastName: insightData.lastName,
        lastnameLike: insightData.lastnameLike,
        mandal: insightData.mandal,
        name: insightData.name.toString(),
        pollingStationName: insightData.pollingStationName,
        sectionNoAndName: insightData.sectionNoAndName,
        contactMode: insightData.contactMode,
        caste: insightData.caste,
        contactNumber: insightData.contactNumber,
        partyInclinationId: insightData.partyInclinationId,
        profession: insightData.profession,
        nonLocalAddress: insightData.nonLocalAddress,
        dissident: insightData.dissident,
        interestToJoinParty: insightData.interestToJoinParty,
        physicallyChallenged: insightData.physicallyChallenged,
        habitationsId: insightData.habitationsId,
        fromAge: insightData.fromAge,
        toAge: insightData.toAge,
        // schemes:
        discription: insightData.discription,
        nameOfYourQuickInsights: insightData.nameOfYourQuickInsights,
        ivinIds: insightData.ivinIds);
    try {
      LoadingUtils.showLoader();
      RepoResponse<GenericResponse> response =
          await quickInsighrrepository.updateQuickInsights(
        token: AppStorage.getUser().bearerToken ?? '',
        id: insightData.id ?? 0,
        requestData: requestData,
      );
      LoadingUtils.hideLoader();
      if (response.data?.status == 200 || response.data?.status == 201) {
        quickInsightList[idx] =
            QuickInsightResponse.fromJson(response.data?.result);
        quickInsightList.refresh();
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

  void toggleGender({required String name}) {
    selectedGender.value = name;
  }

  void onCheckedFilter({required String name}) {
    if (selectedFilter.contains(name)) {
      selectedFilter.remove(name);
    } else {
      selectedFilter.add(name);
    }
    filterList.refresh();
  }

  void resetSearch() {
    selectedFilter.clear();
    ageRangeValues.value = const RangeValues(18, 100);
  }

  void onEditInsights({required QuickInsightResponse data}) {
    print(data);
  }

  resetForm() {
    constituency.controller.clear();
    mandal.controller.clear();
    pollingstationnames.controller.clear();
    sectionNameAndnumber.controller.clear();
    name.controller.clear();
    lastname.controller.clear();
    lastNameLikeSearch.controller.clear();
    house_no.controller.clear();
    voter_id.controller.clear();
    nameOfYourQuickInsights.controller.clear();
    description.controller.clear();
    selectedFilter.clear();
    selectedGender.value = '';
  }
}

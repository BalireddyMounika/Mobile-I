import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/VoterResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/update_voter_data_request.dart';
import 'package:prasada_political_portfolio/app/data/repository/analytic_repository.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';
import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';

class UpdateVoterCardController extends GetxController {
  AnalyticRepository repository = AnalyticRepository();

  RxString gender = RxString('');
  RxString voterRefImageUrl = RxString('');
  RxInt currentIvinId = RxInt(0);

  ///Update Voter Screen
  TextFieldWrapper voterIdWrapper = TextFieldWrapper();
  TextFieldWrapper serialNumWrapper = TextFieldWrapper();
  TextFieldWrapper nameWrapper = TextFieldWrapper();
  TextFieldWrapper lastNameWrapper = TextFieldWrapper();
  TextFieldWrapper dependentNameWrapper = TextFieldWrapper();
  TextFieldWrapper dependentRelationWrapper = TextFieldWrapper();
  TextFieldWrapper houseNumWrapper = TextFieldWrapper();
  TextFieldWrapper ageWrapper = TextFieldWrapper();
  TextFieldWrapper state = TextFieldWrapper();
  TextFieldWrapper district = TextFieldWrapper();
  TextFieldWrapper constituency = TextFieldWrapper();
  TextFieldWrapper mandal = TextFieldWrapper();
  TextFieldWrapper pollingStationNumber = TextFieldWrapper();
  TextFieldWrapper pollingStationName = TextFieldWrapper();
  TextFieldWrapper pollingStationLocation = TextFieldWrapper();
  TextFieldWrapper sectionNumberName = TextFieldWrapper();
  TextFieldWrapper voterSlip = TextFieldWrapper();

  RxBool isLoading = RxBool(false);

  RxList<String> districtList = RxList();
  RxList<String> constituencyList = RxList();
  RxList<String> mandalList = RxList();
  RxList<String> polingStationList = RxList();
  RxList<String> sectionNameAndNumberList = RxList();
  RxList<String> polingStationNumberList = RxList();
  RxList<String> polingStationLocationList = RxList();

  @override
  void onInit() {
    super.onInit();
    fillData();
  }

  fillData() {
    if (Get.arguments != null) {}
    VoterResponse voterResponse = Get.arguments;
    fillVoterData(voterResponse);
    getVoterRefImage(imageName: voterResponse.voterSlip ?? '');
  }

  Future<void> getVoterRefImage({required String imageName}) async {
    isLoading.value = true;
    RepoResponse<GenericResponse> response = await repository.getVoterRefImage(
        folderName: 'slip_voter_images',
        imageName: imageName,
        token: AppStorage.getUser().bearerToken ?? '');
    isLoading.value = false;
    if (response.data?.hasError == false) {
      voterRefImageUrl.value = response.data?.result;
    }
  }

  void genderfunction(String value) async {
    gender.value = value;
  }

  void fillVoterData(VoterResponse response) {
    currentIvinId.value = response.ivinId ?? 0;
    voterIdWrapper.controller.text = response.voterId ?? '';
    voterSlip.controller.text = response.voterSlip ?? '';
    serialNumWrapper.controller.text = response.voterSerialNumber ?? '';
    nameWrapper.controller.text = response.name ?? '';
    lastNameWrapper.controller.text = response.lastName ?? '';
    dependentNameWrapper.controller.text = response.guardian ?? '';
    dependentRelationWrapper.controller.text = response.guardian ?? '';
    houseNumWrapper.controller.text = response.home ?? '';
    ageWrapper.controller.text = response.age ?? '';
    gender.value = response.gender ?? '';
    state.controller.text = response.state ?? '';
    district.controller.text = response.district ?? '';
    constituency.controller.text = response.constituency ?? '';
    pollingStationNumber.controller.text = response.pollingStationNumber ?? '';
    pollingStationName.controller.text = response.pollingStationName ?? '';
    pollingStationLocation.controller.text =
        response.pollingStationLocation ?? '';
    sectionNumberName.controller.text = '';
  }

  void resetPage() {
    voterIdWrapper.controller.text = '';
    serialNumWrapper.controller.text = '';
    nameWrapper.controller.text = '';
    lastNameWrapper.controller.text = '';
    dependentNameWrapper.controller.text = '';
    dependentRelationWrapper.controller.text = '';
    houseNumWrapper.controller.text = '';
    ageWrapper.controller.text = '';
    gender.value = "";
    state.controller.text = "";
    district.controller.text = "";
    constituency.controller.text = "";
    pollingStationNumber.controller.text = "";
    pollingStationName.controller.text = "";
    pollingStationLocation.controller.text = "";
    sectionNumberName.controller.text = "";
  }

  Future<void> onSelectState({required String stateName}) async {
    state.controller.text = stateName;
    await getDistrict(stateName: stateName);
  }

  Future<void> onSelectDistrict({required String districtName}) async {
    district.controller.text = districtName;
    await getConstituency(districtName: districtName);
  }

  Future<void> onSelectConstituency({required String constituencyName}) async {
    constituency.controller.text = constituencyName;
    await getMandal(constituencyName: constituencyName);
  }

  Future<void> onSelectMandel({required String mandalName}) async {
    mandal.controller.text = mandalName;
    await getPolingStation(mandalName: mandalName);
  }

  Future<void> onSelectPolingStation(
      {required String polingStationName}) async {
    pollingStationName.controller.text = polingStationName;

    await getSectionNameAndNumber(polingStationName: polingStationName);
    await getPolingStationNumber(polingStationName: polingStationName);
  }

  Future<void> onSelectPolingStationNumber(
      {required String polingStationNumber}) async {
    pollingStationNumber.controller.text = polingStationNumber;
    await getSectionLocation(polingStationNumber: polingStationNumber);
  }

  Future<void> getSectionLocation({required String polingStationNumber}) async {
    LoadingUtils.showLoader();
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response =
        await repository.getPolingStationLocation(
            polingStationNumber: polingStationNumber,
            token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.showLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      List sectionData = response.data?.result as List;
      polingStationLocationList.clear();
      for (var e in sectionData) {
        polingStationLocationList.add(e);
      }
      polingStationLocationList.refresh();
    } else {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'something went wrong');
    }
  }

  Future<void> getSectionNameAndNumber(
      {required String polingStationName}) async {
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response =
        await repository.getAllSectionNameAndNumber(
            sectionNameAndNumber: polingStationName,
            token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.hideLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      List sectionData = response.data?.result as List;
      sectionNameAndNumberList.clear();
      for (var e in sectionData) {
        sectionNameAndNumberList.add(e);
      }
      sectionNameAndNumberList.refresh();
    } else {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'something went wrong');
    }
  }

  Future<void> getPolingStationNumber(
      {required String polingStationName}) async {
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response =
        await repository.getPolingStationNumber(
            polingStationName: polingStationName,
            token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.hideLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      List data = response.data?.result as List;
      polingStationNumberList.clear();
      for (var e in data) {
        polingStationNumberList.add(e);
      }
      polingStationNumberList.refresh();
    } else {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'something went wrong');
    }
  }

  Future<void> getPolingStation({required String mandalName}) async {
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response = await repository.getPolingStation(
        mandalName: mandalName, token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.hideLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      List polingStationData = response.data?.result as List;
      polingStationList.clear();
      for (var e in polingStationData) {
        polingStationList.add(e);
      }
      polingStationList.refresh();
    } else {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'something went wrong');
    }
  }

  Future<void> getDistrict({required String stateName}) async {
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response = await repository.getDistrict(
        stateName: stateName, token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.hideLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      List districtData = response.data?.result as List;
      districtList.clear();
      for (var e in districtData) {
        districtList.add(e);
      }
      districtList.refresh();
    } else {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'something went wrong');
    }
  }

  Future<void> getConstituency({required String districtName}) async {
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response = await repository.getConstituency(
        districtName: districtName,
        token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.hideLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      List data = response.data?.result as List;
      constituencyList.clear();
      for (var e in data) {
        constituencyList.add(e);
      }
      constituencyList.refresh();
    } else {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'something went wrong');
    }
  }

  Future<void> getMandal({required String constituencyName}) async {
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response = await repository.getManda(
        constituencyName: constituencyName,
        token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.hideLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      List mandalData = response.data?.result as List;
      mandalList.clear();
      for (var e in mandalData) {
        mandalList.add(e);
      }
      mandalList.refresh();
    } else {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'something went wrong');
    }
  }

  Future<void> updateVoterData() async {
    try {
      UpdateVoterDataRequest requestData = UpdateVoterDataRequest(
        voterId: voterIdWrapper.controller.text,
        name: nameWrapper.controller.text,
        firstName: nameWrapper.controller.text,
        lastName: lastNameWrapper.controller.text,
        relationType: dependentRelationWrapper.controller.text,
        guardian: dependentNameWrapper.controller.text,
        home: houseNumWrapper.controller.text,
        age: ageWrapper.controller.text,
        gender: gender.value,
        state: state.controller.text,
        district: district.controller.text,
        constituency: constituency.controller.text,
        pollingStationNumber: pollingStationNumber.controller.text,
        pollingStationName: pollingStationName.controller.text,
        pollingStationLocation: pollingStationLocation.controller.text,
        voterSerialNumber: serialNumWrapper.controller.text,
        voterSlip: voterSlip.controller.text,
        mandal: mandal.controller.text,
        sectionNoAndName: sectionNumberName.controller.text,
        assemblyConstituencyNoAndName: 'qwerty',
        mainTownORVillage: 'qwerty',
        policeStation: 'qwerty',
        pinCode: 'qwerty',
        revenueDivision: 'qwerty',
      );

      LoadingUtils.showLoader();
      RepoResponse<GenericResponse> response = await repository.updateVoterData(
          ivinId: currentIvinId.value,
          requestData: requestData,
          token: AppStorage.getUser().bearerToken ?? '');
      LoadingUtils.hideLoader();

      if (response.data?.status == 200 || response.data?.status == 201) {
        Get.back();
        AppUtils.showSnackBar('Data Updated!');
      } else {
        if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
        AppUtils.showSnackBar(response.error?.message ??
            response.data?.message ??
            'Something went wrong');
      }
    } catch (e) {
      print(e);
    } finally {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    }
  }
}

import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/repository/communication_repository.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';

import '../../../../base/base_controller.dart';
import '../../../../utils/app_utils.dart';
import '../../../../utils/helper/text_field_wrapper.dart';
import '../../../../utils/loading/loading_utils.dart';
import '../../../data/model/dto/RepoResponse.dart';
import '../../../data/model/response/CommunicationModel.dart';
import '../../../data/model/response/VoterResponse.dart';
import '../../../data/model/response/generic_response.dart';

class CommunicationSearchViewController
    extends BaseController<CommunicationRepository> {
  TextFieldWrapper constituency = TextFieldWrapper();
  TextFieldWrapper mandal = TextFieldWrapper();
  TextFieldWrapper pollingStationNames = TextFieldWrapper();
  TextFieldWrapper sectionNameAndNumber = TextFieldWrapper();
  TextFieldWrapper name = TextFieldWrapper();
  TextFieldWrapper lastname = TextFieldWrapper();
  TextFieldWrapper houseNo = TextFieldWrapper();

  RxString gender = RxString('');

  RxList<String> mandalList = RxList();
  RxList<String> polingStationList = RxList();
  RxList<String> sectionNameAndNumberList = RxList();
  RxList<VoterResponse> voterDataList = RxList();
  RxInt voterDataCount = RxInt(0);

  // RxList<String> ivinIds = RxList();
  RxList<String> ivinIds = RxList<String>();

  void genderFunction(String value) async {
    gender.value = value;
  }

  void on_Reset_Page() {
    constituency.controller.clear();
    mandal.controller.clear();
    pollingStationNames.controller.clear();
    sectionNameAndNumber.controller.clear();
    gender.value = "";
    name.controller.clear();
    lastname.controller.clear();
    houseNo.controller.clear();
  }

  Future<void> onSelectConstituency({required String constituencyName}) async {
    constituency.controller.text = constituencyName;
    if (mandalList.isEmpty || polingStationList.isEmpty) {
      await getMandal(constituencyName: constituencyName);
    }
  }

  Future<void> onSelectMandal({required String mandalName}) async {
    mandal.controller.text = mandalName;
    await getPolingStation(mandalName: mandalName);
  }

  Future<void> onSelectPolingStation(
      {required String polingStationNameAndNumber}) async {
    pollingStationNames.controller.text = polingStationNameAndNumber;

    await getSectionNameAndNumber(
        polingStationName: polingStationNameAndNumber);
  }

  Future<void> getPolingStation({required String mandalName}) async {
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> polingStationResponse =
        await repository.getPolingStation(
            mandalName: mandalName,
            token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.hideLoader();
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
      AppUtils.showSnackBar(response.error?.message ?? 'something went wrong');
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
      AppUtils.showSnackBar(response.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getFilteredVoterData({required String polingStationName}) async {
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
      AppUtils.showSnackBar(response.error?.message ?? 'something went wrong');
    }
  }

  Future<void> getCommunicationFilteredVoter() async {
    try {
      if (constituency.controller.text.isNotEmpty &&
          mandal.controller.text.isNotEmpty &&
          pollingStationNames.controller.text.isNotEmpty &&
          gender.value.isNotEmpty) {
        LoadingUtils.showLoader();
        RepoResponse<GenericResponse> response =
            await repository.getCommunicationFilteredVoterData(
          token: AppStorage.getUser().bearerToken ?? '',
          constituency: constituency.controller.text,
          gender: gender.value.toUpperCase(),
          home: houseNo.controller.text.isNotEmpty
              ? houseNo.controller.text
              : 'null',
          lastName: lastname.controller.text.isNotEmpty
              ? lastname.controller.text
              : 'null',
          mandal: mandal.controller.text,
          name: name.controller.text.isNotEmpty ? name.controller.text : 'null',
          pollingStationName: pollingStationNames.controller.text,
          sectionName: sectionNameAndNumber.controller.text.isNotEmpty
              ? sectionNameAndNumber.controller.text
              : 'null',
          voterId: 'null',
        );
        LoadingUtils.hideLoader();
        if (response.data?.status == 200 || response.data?.status == 201) {
          CommunicationModel communicationResponse =
              CommunicationModel.fromJson(response.data?.result);
          voterDataCount.value = communicationResponse.count ?? 0;

          // ivinIds.assignAll(
          //   (communicationResponse.ivinIds ?? []).map((item) => item.toString()),
          // );

          List<dynamic> ivinIdsCount = communicationResponse.ivinIds ?? [];
          ivinIds.clear();
          for (var count in ivinIdsCount) {
            ivinIds.add(count.toString());
          }

          // ivinIds.value = communicationResponse.ivinIds?.length as List<String>;

          print(" count ${voterDataCount.value}");

          // print(" 456 ${ivinIds}");
          // String ivinIdsList = ivinIds.join(',');

          String ivinIdsList = '';
          for (int i = 0; i < ivinIds.length; i++) {
            ivinIdsList += ivinIds[i];
            if (i < ivinIds.length - 1) {
              ivinIdsList += ',';
            }
          }
          print("ivinids $ivinIdsList");
        } else {
          AppUtils.showSnackBar(
              response.error?.message ?? 'something went wrong');
        }
      } else {
        if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
        AppUtils.showSnackBar('Please fill details');
      }
    } catch (e) {
      print('');
    }
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/repository/profile_repository.dart';
import 'package:prasada_political_portfolio/base/base_controller.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';

import '../../../../utils/helper/text_field_wrapper.dart';

class ProfileController extends BaseController<ProfileRepository> {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPartyName();
  }

  TextFieldWrapper name = TextFieldWrapper();
  TextFieldWrapper age = TextFieldWrapper();
  TextFieldWrapper placeOfBirth = TextFieldWrapper();
  TextFieldWrapper dateOfBirth = TextFieldWrapper();
  TextFieldWrapper emailId = TextFieldWrapper();
  TextFieldWrapper address = TextFieldWrapper();
  TextFieldWrapper city = TextFieldWrapper();
  TextFieldWrapper state = TextFieldWrapper();
  TextFieldWrapper pinCode = TextFieldWrapper();
  TextFieldWrapper candidateBrief = TextFieldWrapper();
  TextFieldWrapper slogan = TextFieldWrapper();
  TextFieldWrapper partyAffiliationText = TextFieldWrapper();
  TextFieldWrapper activistsTextController = TextFieldWrapper();
  TextFieldWrapper achievementsTextController = TextFieldWrapper();
  TextFieldWrapper prioritiesTextController = TextFieldWrapper();
  TextFieldWrapper videoUrlsTextController = TextFieldWrapper();
  TextFieldWrapper ecStatusText = TextFieldWrapper();
  TextFieldWrapper ecStatusDropDownText = TextFieldWrapper();
  TextFieldWrapper politicalHistoryTitle = TextFieldWrapper();
  TextFieldWrapper politicalHistoryDropDownText = TextFieldWrapper();
  TextFieldWrapper politicalHistoryFromDateText = TextFieldWrapper();
  TextFieldWrapper politicalHistoryToDateText = TextFieldWrapper();

  var aboutYou = ''.obs;
  var candidateInformation = ''.obs;
  var politicalHistory = ''.obs;
  var socialMedia = ''.obs;
  var ecStatus = ''.obs;
  // RxBool status_check = false.obs;
  var genderValue = ''.obs;

  //image-picker
  var selectedPartyLogoImagepath = ''.obs;
  var selectedSymbolImagepath = ''.obs;

  //About you date of birth date picker

  chooseDateOfBirth() async {
    DateTime? pickedEventData = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2090),
    );
    if (pickedEventData != null &&
        pickedEventData != dateOfBirth.controller.text) {
      final dateFormat = DateFormat('dd-MM-yyyy').format(pickedEventData);
      dateOfBirth.controller.text = dateFormat;
    }
  }

  //Political History Dates

  choosePoliticalHistoryFromDate() async {
    DateTime? pickedEventData = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2090),
    );
    if (pickedEventData != null &&
        pickedEventData != politicalHistoryFromDateText.controller.text) {
      final dateFormat = DateFormat('dd-MM-yyyy').format(pickedEventData);
      politicalHistoryFromDateText.controller.text = dateFormat;
    }
  }

  choosePoliticalHistoryToDate() async {
    DateTime? pickedEventData = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2090),
    );
    if (pickedEventData != null &&
        pickedEventData != politicalHistoryToDateText.controller.text) {
      final dateFormat = DateFormat('dd-MM-yyyy').format(pickedEventData);
      politicalHistoryToDateText.controller.text = dateFormat;
    }
  }

  //file-picker
  var PartyFileName = ''.obs;
  var PartyFilePath = ''.obs;
  final PartyFileNamesList = <String>[].obs;
  final PartyFilePathsList = <String>[].obs;

  // Future<void> pickPartyFile() async {
  //   PlatformFile? file;
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(type: FileType.any);
  //   if (result != null) {
  //     file = result.files.first;
  //     PartyFileName.value = file.name;
  //     PartyFilePath.value = file.path.toString();
  //     PartyFileNamesList.addAll([PartyFileName.value]);
  //     PartyFilePathsList.addAll([PartyFilePath.value]);
  //   }
  // }

  void removeFileNames(index) {
    PartyFileNamesList.removeAt(index);
  }

  //Activists
  final activistsTextList = <String>[].obs;
  final achievementsTextList = <String>[].obs;
  final prioritiesTextList = <String>[].obs;
  final youTubeTextList = <String>[].obs;

  void resetTextLists() {
    activistsTextList.clear();
    achievementsTextList.clear();
    prioritiesTextList.clear();
    youTubeTextList.clear();
  }

  void onAddActivistsText(String text) {
    activistsTextList.add(text);
  }

  void onAddAchievementsText(String text) {
    achievementsTextList.add(text);
  }

  void onAddPrioritiesText(String text) {
    prioritiesTextList.add(text);
  }

  void onAddYoutubeText(String text) {
    youTubeTextList.add(text);
  }

  void onRemoveYoutubeText(int index) {
    youTubeTextList.removeAt(index);
  }

  void onRemoveActivistsText(int index) {
    activistsTextList.removeAt(index);
  }

  void onRemoveAchievementsText(int index) {
    achievementsTextList.removeAt(index);
  }

  void onRemovePrioritiesText(int index) {
    prioritiesTextList.removeAt(index);
  }

  // void onSelectDropDown(value) {
  //   dropDownSelectedValue.value = value;
  // }

  void onChangeStepperValue(String value) {
    aboutYou.value = value;
    candidateInformation.value = value;
    politicalHistory.value = value;
    socialMedia.value = value;
    ecStatus.value = value;
  }

  void onChangeGender(String value) {
    genderValue.value = value;
  }

  void getLogoImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPartyLogoImagepath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeLogoImage() {
    final file = File(selectedPartyLogoImagepath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedPartyLogoImagepath.value = '';
  }

  void removeSymbolImage() {
    final file = File(selectedSymbolImagepath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedSymbolImagepath.value = "";
  }

  void getSymbolImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedSymbolImagepath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  //Profile-Social Media controllers

  var selectedPartyManifesto = ''.obs;
  var selectedLogo1Imagepath = ''.obs;
  var selectedLogo2Imagepath = ''.obs;
  var selectedLogo3Imagepath = ''.obs;
  var selectedLogo4Imagepath = ''.obs;
  var selectedLogo5Imagepath = ''.obs;
  var selectedProfilePicImagepath = ''.obs;

  void getLogo1Image(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedLogo1Imagepath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void getLogo2Image(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedLogo2Imagepath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void getLogo3Image(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedLogo3Imagepath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void getLogo4Image(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedLogo4Imagepath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void getLogo5Image(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedLogo5Imagepath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void getLogo6Image(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedProfilePicImagepath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeLogo1Image() {
    final file = File(selectedLogo1Imagepath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedLogo1Imagepath.value = '';
  }

  void removeLogo2Image() {
    final file = File(selectedLogo2Imagepath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedLogo2Imagepath.value = '';
  }

  void removeLogo3Image() {
    final file = File(selectedLogo3Imagepath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedLogo3Imagepath.value = '';
  }

  void removeLogo4Image() {
    final file = File(selectedLogo4Imagepath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedLogo4Imagepath.value = '';
  }

  void getPartyManifestoImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedPartyManifesto.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removePartyManifestoImage() {
    final file = File(selectedPartyManifesto.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedPartyManifesto.value = '';
  }

  void removeLogo5Image() {
    final file = File(selectedLogo5Imagepath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedLogo5Imagepath.value = '';
  }

  void removeLogo6Image() {
    final file = File(selectedProfilePicImagepath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedProfilePicImagepath.value = '';
  }

  final TelegramLinkList = <String>[].obs;
  final TelegramDescList = <String>[].obs;
  final FacebookLinkList = <String>[].obs;
  final FacebookDescList = <String>[].obs;
  final TwitterLinkList = <String>[].obs;
  final TwitterDescList = <String>[].obs;
  final WhatsappLinkList = <String>[].obs;
  final WhatsappDescList = <String>[].obs;
  final LinkedInLinkList = <String>[].obs;
  final LinkedInDescList = <String>[].obs;
  final YoutubeLinkList = <String>[].obs;
  final YoutubeDescList = <String>[].obs;
  final InstagramLinkList = <String>[].obs;
  final InstagramDescList = <String>[].obs;

  TextFieldWrapper telegramLinkTextController = TextFieldWrapper();
  TextFieldWrapper telegramDescTextController = TextFieldWrapper();
  TextFieldWrapper facebookLinkTextController = TextFieldWrapper();
  TextFieldWrapper facebookDescTextController = TextFieldWrapper();
  TextFieldWrapper twitterLinkTextController = TextFieldWrapper();
  TextFieldWrapper twitterDescTextController = TextFieldWrapper();
  TextFieldWrapper whatsappLinkTextController = TextFieldWrapper();
  TextFieldWrapper whatsappDescTextController = TextFieldWrapper();
  TextFieldWrapper linkedInLinkTextController = TextFieldWrapper();
  TextFieldWrapper linkedInDescTextController = TextFieldWrapper();
  TextFieldWrapper youtubeLinkTextController = TextFieldWrapper();
  TextFieldWrapper youtubeDescTextController = TextFieldWrapper();
  TextFieldWrapper InstagramLinkTextController = TextFieldWrapper();
  TextFieldWrapper InstagramDescTextController = TextFieldWrapper();

  void onAddTelegramLinkItems(String text_1) {
    TelegramLinkList.add(text_1);
  }

  void onAddTelegramDescItems(String text_2) {
    TelegramDescList.add(text_2);
  }

  void onAddFacebookLinkItems(String text_1) {
    FacebookLinkList.add(text_1);
  }

  void onAddFacebookDescItems(String text_2) {
    FacebookDescList.add(text_2);
  }

  void onAddTwitterLinkItems(String text_1) {
    TwitterLinkList.add(text_1);
  }

  void onAddTwitterDescItems(String text_2) {
    TwitterDescList.add(text_2);
  }

  void onAddWhatsappLinkItems(String text_1) {
    WhatsappLinkList.add(text_1);
  }

  void onAddWhatsappDescItems(String text_2) {
    WhatsappDescList.add(text_2);
  }

  void onAddLinkedInLinkItems(String text_1) {
    LinkedInLinkList.add(text_1);
  }

  void onAddLinkedInDescItems(String text_2) {
    LinkedInDescList.add(text_2);
  }

  void onAddYoutubeLinkItems(String text_1) {
    YoutubeLinkList.add(text_1);
  }

  void onAddYoutubeDescItems(String text_2) {
    YoutubeDescList.add(text_2);
  }

  void onAddInstagramLinkItems(String text_1) {
    InstagramLinkList.add(text_1);
  }

  void onAddInstagramDescItems(String text_2) {
    InstagramDescList.add(text_2);
  }

  void onRemoveTelegramItems(int index) {
    TelegramLinkList.removeAt(index);
    TelegramDescList.removeAt(index);
  }

  void onRemoveFacebookItems(int index) {
    FacebookLinkList.removeAt(index);
    FacebookDescList.removeAt(index);
  }

  void onRemoveTwitterItems(int index) {
    TwitterLinkList.removeAt(index);
    TwitterDescList.removeAt(index);
  }

  void onRemoveWhatsappItems(int index) {
    WhatsappLinkList.removeAt(index);
    WhatsappDescList.removeAt(index);
  }

  void onRemoveLinkedInItems(int index) {
    LinkedInLinkList.removeAt(index);
    LinkedInDescList.removeAt(index);
  }

  void onRemoveYoutubeItems(int index) {
    YoutubeLinkList.removeAt(index);
    YoutubeDescList.removeAt(index);
  }

  void onRemoveInstagramItems(int index) {
    InstagramLinkList.removeAt(index);
    InstagramDescList.removeAt(index);
  }

  //Political History
  final HistoryListItems = <String>[].obs;
  final HistoryPartyNames = <String>[].obs;
  final HistoryPersonDesignation = <String>[].obs;
  final HistoryFromDate = <String>[].obs;
  final HistoryToDate = <String>[].obs;

  void onAddHistoryList(String text_1, text_2, text_3, text_4) {
    HistoryListItems.add('');
    HistoryPartyNames.addAll([text_1]);
    HistoryPersonDesignation.addAll([text_2]);
    HistoryFromDate.addAll([text_3]);
    HistoryToDate.addAll([text_4]);
  }

  void onRemoveHistoryList(int index) {
    HistoryListItems.removeAt(index);
    HistoryPartyNames.removeAt(index);
    HistoryPersonDesignation.removeAt(index);
    HistoryFromDate.removeAt(index);
    HistoryToDate.removeAt(index);
  }

  void onResetAboutPage() {
    selectedLogo1Imagepath.value = '';
    selectedLogo2Imagepath.value = '';
    selectedLogo3Imagepath.value = '';
    selectedLogo4Imagepath.value = '';
    selectedLogo5Imagepath.value = '';
    selectedProfilePicImagepath.value = '';
    name.controller.clear();
    placeOfBirth.controller.clear();
    dateOfBirth.controller.clear();
    age.controller.clear();
    genderValue.value = "";
    emailId.controller.clear();
    address.controller.clear();
    city.controller.clear();
    state.controller.clear();
    pinCode.controller.clear();
    candidateBrief.controller.clear();
  }

  void onResetCandidateInfoPage() {
    selectedPartyLogoImagepath.value = '';
    selectedSymbolImagepath.value = '';
    slogan.controller.clear();
    partyAffiliationText.controller.clear();
    activistsTextList.clear();
    achievementsTextList.clear();
    prioritiesTextList.clear();
    selectedPartyManifesto.value = "";
    youTubeTextList.clear();
  }

  void onResetPoliticalPage() {
    politicalHistoryDropDownText.controller.clear();
    politicalHistoryTitle.controller.clear();
    politicalHistoryFromDateText.controller.clear();
    politicalHistoryToDateText.controller.clear();
    HistoryListItems.clear();
    HistoryPartyNames.clear();
    HistoryPersonDesignation.clear();
    HistoryFromDate.clear();
    HistoryToDate.clear();
  }

  void onResetSocialPage() {
    TelegramLinkList.clear();
    TelegramDescList.clear();
    FacebookLinkList.clear();
    FacebookDescList.clear();
    TwitterLinkList.clear();
    TwitterDescList.clear();
    WhatsappLinkList.clear();
    WhatsappDescList.clear();
    LinkedInLinkList.clear();
    LinkedInDescList.clear();
    YoutubeLinkList.clear();
    YoutubeDescList.clear();
    InstagramLinkList.clear();
    InstagramDescList.clear();
  }

  void onResetEcPage() {
    ecStatusDropDownText.controller.clear();
    ecStatusText.controller.clear();
  }

  //Api integration
  RxList<String> partyNamesList = RxList();
  RxList<String> politicalPartyNamesList = RxList();

  Future<void> getPartyName() async {
    RepoResponse<GenericResponse> partyNamesResponse =
        await repository.getPartyNames();
    if (partyNamesResponse.data?.status == 200 ||
        partyNamesResponse.data?.status == 201) {
      List partyNamesData = partyNamesResponse.data?.result as List;
      partyNamesList.clear();
      for (var i in partyNamesData) {
        partyNamesList.add(i["PartyName"]);
        politicalPartyNamesList.add(i["PartyName"]);
      }
      print(partyNamesList.length);
      partyNamesList.refresh();
    } else {
      AppUtils.showSnackBar(
          partyNamesResponse.error?.message ?? 'something went wrong');
    }
  }

  // Future<void> postProfileAboutYouData()async{
  //   CreateProfileRequestModel createProfileRequest = CreateProfileRequestModel(userId:AppStorage.getUser().id ?? 0, profilePicture:selectedProfilePicImagepath.value, name:, dateOfBirth:, placeOfBirth: placeOfBirth, age: age, gender: gender, email: email, phoneNumber: phoneNumber, address: address, city: city, state: state, pinCode: pinCode, candidateBrief: candidateBrief, slogan: slogan)
  //   RepoResponse<GenericResponse> postDataResponse = await repository.postProfileAboutAllData();
  //   if(postDataResponse.data?.status ==200 || postDataResponse.data?.status==201){
  //     List partyNamesData = postDataResponse.data?.result as List;
  //     partyNamesList.clear();
  //     for(var i in partyNamesData){
  //       partyNamesList.add(i["PartyName"]);
  //       politicalPartyNamesList.add(i["PartyName"]);
  //     }
  //     print(partyNamesList.length);
  //     partyNamesList.refresh();
  //   }else{
  //     AppUtils.showSnackBar(postDataResponse.error?.message ?? 'something went wrong');
  //   }
  // }

// Future<void> postProfilePoliticalData()async{
//   CreatePoliticalRequestModel createProfileRequest =CreatePoliticalRequestModel(candidatureInformationId:AppStorage.getUser().id ?? 0, userId:AppStorage.getUser().id ?? 0, partyName: politicalHistoryDropDownText.controller.text, officeHeld: politicalHistoryTitle.controller.text, fromDate:, toDate: toDate);
//   RepoResponse<GenericResponse> postDataResponse = await repository.postProfilePoliticalData();
//   if(postDataResponse.data?.status ==200 || postDataResponse.data?.status==201){
//     List partyNamesData = postDataResponse.data?.result as List;
//     partyNamesList.clear();
//     for(var i in partyNamesData){
//       partyNamesList.add(i["PartyName"]);
//       politicalPartyNamesList.add(i["PartyName"]);
//     }
//     print(partyNamesList.length);
//     partyNamesList.refresh();
//   }else{
//     AppUtils.showSnackBar(postDataResponse.error?.message ?? 'something went wrong');
//   }
// }
}

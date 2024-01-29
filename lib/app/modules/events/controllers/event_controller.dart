import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';

class EventsController extends GetxController {
  //Stepper Values
  var firstSection = ''.obs;
  var secondSection = ''.obs;
  var thirdSection = ''.obs;

  List<String> eventTypeList = ['View all', 'Past', 'Upcoming', 'Customize'];

  void changeStepperValue(String value) {
    firstSection.value = value;
    secondSection.value = value;
    thirdSection.value = value;
  }

  //image-picker values
  var selectedEventCreateFirstImagePath = ''.obs;
  var selectedEventCreateSecondImagePath = ''.obs;
  var selectedEventCreateThirdImagePath = ''.obs;
  var selectedEventCreateFourthImagePath = ''.obs;

  void getEventCreateFirstImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedEventCreateFirstImagePath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeEventCreateFirstImage() {
    final file = File(selectedEventCreateFirstImagePath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedEventCreateFirstImagePath.value = '';
  }

  void getEventCreateSecondImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedEventCreateSecondImagePath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeEventCreateSecondImage() {
    final file = File(selectedEventCreateSecondImagePath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedEventCreateSecondImagePath.value = '';
  }

  void getEventCreateThirdImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedEventCreateThirdImagePath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeEventCreateThirdImage() {
    final file = File(selectedEventCreateThirdImagePath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedEventCreateThirdImagePath.value = '';
  }

  void getEventCreateFourthImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedEventCreateFourthImagePath.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeEventCreateFourthImage() {
    final file = File(selectedEventCreateFourthImagePath.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedEventCreateFourthImagePath.value = '';
  }

  //Location radio button
  var selectedLocationValue = ''.obs;

  void onChangeLocation(String value) {
    selectedLocationValue.value = value;
  }

  //Contact Lists
  final contactLists = <String>[].obs;
  final virtualLinkLists = <String>[].obs;

  void onAddContactsList(text) {
    contactLists.add(text);
  }

  void onAddVirtualLinks(text) {
    virtualLinkLists.add(text);
  }

  void onRemoveContactsList(index) {
    contactLists.removeAt(index);
  }

  void onRemoveLinksList(index) {
    virtualLinkLists.removeAt(index);
  }

  //Event page
  TextFieldWrapper eventFirstPageDropDownText = TextFieldWrapper();
  TextFieldWrapper eventCategoryDropDownText = TextFieldWrapper();
  TextFieldWrapper contactsTextController = TextFieldWrapper();
  TextFieldWrapper titleTextController = TextFieldWrapper();
  TextFieldWrapper descriptionTextController = TextFieldWrapper();
  TextFieldWrapper virtualLinkTextController = TextFieldWrapper();
  TextFieldWrapper guestNameTextController = TextFieldWrapper();
  TextFieldWrapper guestSpeakerTextController = TextFieldWrapper();
  TextFieldWrapper eventHostTextController = TextFieldWrapper();
  TextFieldWrapper eventExpectedTextController = TextFieldWrapper();
  TextFieldWrapper eventInstructionTextController = TextFieldWrapper();
  TextFieldWrapper eventTagsTextController = TextFieldWrapper();
  TextFieldWrapper eventOrganizerTextController = TextFieldWrapper();
  TextFieldWrapper eventSponsorNameTextController = TextFieldWrapper();
  TextFieldWrapper eventSponsorTypeTextController = TextFieldWrapper();
  TextFieldWrapper eventLocationAddress = TextFieldWrapper();
  var selectedGuestImage = ''.obs;
  var selectedGuestSpeakerImage = ''.obs;
  var selectedEventFloorImage = ''.obs;
  var selectedOrganizerImage = ''.obs;
  var selectedSponsorImage = ''.obs;
  final guestsImagesList = <String>[].obs;
  final guestsNamesList = <String>[].obs;
  final guestSpeakerImageList = <String>[].obs;
  final guestSpeakerNamesList = <String>[].obs;
  final eventOrganizerImagesList = <String>[].obs;
  final eventOrganizerNamesList = <String>[].obs;
  final eventSponsorsImagesList = <String>[].obs;
  final eventSponsorsNamesList = <String>[].obs;
  final eventSponsorsTypeList = <String>[].obs;

  void onAddGuestsInfoList(text, path) {
    guestsImagesList.addAll([path]);
    guestsNamesList.add(text);
  }

  void onRemoveGuestsInfoList(index) {
    guestsImagesList.removeAt(index);
    guestsNamesList.removeAt(index);
  }

  void onAddGuestsSpeakerList(text, path) {
    guestSpeakerImageList.addAll([path]);
    guestSpeakerNamesList.add(text);
  }

  void onRemoveGuestsSpeakerList(index) {
    guestSpeakerImageList.removeAt(index);
    guestSpeakerNamesList.removeAt(index);
  }

  void onAddOrganizerList(text, path) {
    eventOrganizerImagesList.addAll([path]);
    eventOrganizerNamesList.add(text);
  }

  void onRemoveOrganizerList(index) {
    eventOrganizerImagesList.removeAt(index);
    eventOrganizerNamesList.removeAt(index);
  }

  void onAddSponsorsList(text_1, text_2, path) {
    eventSponsorsImagesList.addAll([path]);
    eventSponsorsNamesList.add(text_1);
    eventSponsorsTypeList.add(text_2);
  }

  void onRemoveSponsorsList(index) {
    eventSponsorsImagesList.removeAt(index);
    eventSponsorsNamesList.removeAt(index);
    eventSponsorsTypeList.removeAt(index);
  }

  void getGuestImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedGuestImage.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeGuestImage() {
    final file = File(selectedGuestImage.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedGuestImage.value = '';
  }

  void getGuestSpeakerImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedGuestSpeakerImage.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeGuestSpeakerImage() {
    final file = File(selectedGuestSpeakerImage.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedGuestSpeakerImage.value = '';
  }

  void getEventFloorImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedEventFloorImage.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeEventFloorImage() {
    final file = File(selectedEventFloorImage.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedEventFloorImage.value = '';
  }

  void getOrganizerImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedOrganizerImage.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeOrganizerImage() {
    final file = File(selectedOrganizerImage.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedOrganizerImage.value = '';
  }

  void getSponsorImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedSponsorImage.value = pickedFile.path;
    } else {
      return null;
    }
  }

  void removeSponsorImage() {
    final file = File(selectedSponsorImage.value);
    if (file.existsSync()) {
      file.deleteSync();
    }
    selectedSponsorImage.value = '';
  }

  //Event Floor Plan
  var eventFloorPlanName = ''.obs;
  var eventFloorPathName = ''.obs;

  //Events date container visibility
  var showEndDateContainer = false.obs;
  void showContainer() {
    showEndDateContainer.toggle();
  }

  //Events Schedule datetime
  Rx<DateTime?> selectedEventStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedEventEndDate = Rx<DateTime?>(null);

  chooseEventStartDate() async {
    DateTime? pickedEventData = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2090),
    );
    if (pickedEventData != null &&
        pickedEventData != selectedEventStartDate.value) {
      selectedEventStartDate.value = pickedEventData;
    }
  }

  chooseEventEndDate() async {
    DateTime? pickedEventData = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2090),
    );
    if (pickedEventData != null &&
        pickedEventData != selectedEventEndDate.value) {
      selectedEventEndDate.value = pickedEventData;
    }
  }
  //date ranges

  getDaysInBetween() {
    DateTime startDate = selectedEventStartDate.value!.toLocal();
    DateTime endDate = selectedEventEndDate.value!.toLocal();
    List<DateTime> dateRange = [];

    dateRange.add(startDate);

    int difference = endDate.difference(startDate).inDays;

    for (int i = 1; i <= difference; i++) {
      dateRange.add(startDate.add(Duration(days: i)));
    }
    final DateFormat dateFormat = DateFormat("EE,dd");
    return dateRange.map((e) => dateFormat.format(e));
    // return dateRange;
  }

  //Events Time picker
  Rx<TimeOfDay?> selectedEventStartTime = Rx<TimeOfDay?>(null);

  chooseEventStartTime() async {
    TimeOfDay? pickedEventTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (pickedEventTime != null &&
        pickedEventTime != selectedEventStartTime.value) {
      selectedEventStartTime.value = pickedEventTime;
    }
  }

  String getFormattedStartTime() {
    if (selectedEventStartTime.value == null) {
      return 'Select';
    } else {
      return selectedEventStartTime.value!.format(Get.context!);
    }
  }

  //Events Time Multiple Fields
  Rx<TimeOfDay?> eventScheduleTime = Rx<TimeOfDay?>(null);

  chooseEventScheduleTime() async {
    TimeOfDay? pickedEventTime = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
        useRootNavigator: true);
    if (pickedEventTime != null && pickedEventTime != eventScheduleTime.value) {
      eventScheduleTime.value = pickedEventTime;
    }
  }

  String getFormattedScheduleTime() {
    if (eventScheduleTime.value == null) {
      return 'Select';
    } else {
      return eventScheduleTime.value!.format(Get.context!);
    }
  }

  removeEventScheduleTime() {
    eventScheduleTime.value = null;
    selectedEventStartTime.value = null;
  }

  TextFieldWrapper eventPlaceTextController = TextFieldWrapper();
  final eventTimeListItems = <String>[].obs;
  final eventStartTimeList = <String>[].obs;
  final eventTimeList = <String>[].obs;
  final eventTimePlaceList = <String>[].obs;

  void onAddEventTimeList(text_1, text_2, text_3) {
    eventTimeListItems.add('');
    eventTimeList.addAll([text_1]);
    eventStartTimeList.addAll([text_2]);
    eventTimePlaceList.addAll([text_3]);
  }

  void onRemoveEventTimeList(index) {
    eventTimeListItems.removeAt(index);
    eventStartTimeList.removeAt(index);
    eventTimeList.removeAt(index);
    eventTimePlaceList.removeAt(index);
  }

  //Create Page Containers List
  final eventCreateContainersList = <String>[].obs;
  void onAddEventContainersList() {
    eventCreateContainersList.add('');
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../utils/helper/text_field_wrapper.dart';

class CommunicationViewController extends GetxController {
  TextFieldWrapper viewall = TextFieldWrapper();

  final communication = <String>[].obs;
  void onAddCommunication() {
    communication.add('');
  }

  var currentDate = ''.obs;
  var currentTime = ''.obs;
  var currentDay = ''.obs;

  void getCurrentDateTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat('MMMM dd, yyyy');
    final timeFormat = DateFormat('hh:mm a');
    final dayFormat = DateFormat('EEEE');

    currentDate.value = dateFormat.format(now);
    currentTime.value = timeFormat.format(now);
    currentDay.value = dayFormat.format(now);
  }

  @override
  void onInit() {
    getCurrentDateTime();
    Timer.periodic(const Duration(seconds: 1), (_) {
      getCurrentDateTime();
    });
    super.onInit();
  }
}

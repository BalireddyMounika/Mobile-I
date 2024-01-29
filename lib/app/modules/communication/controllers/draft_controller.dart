import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DraftViewController extends GetxController {
  var currentDate = ''.obs;
  var currentTime = ''.obs;
  var currentDay = ''.obs;

  @override
  void onInit() {
    getCurrentDateTime();
    Timer.periodic(const Duration(seconds: 1), (_) {
      getCurrentDateTime();
    });
    super.onInit();
  }

  void getCurrentDateTime() {
    final now = DateTime.now();
    final dateFormat = DateFormat('MMMM dd, yyyy');
    final timeFormat = DateFormat('hh:mm a');
    final dayFormat = DateFormat('EEEE');
    currentDate.value = dateFormat.format(now);
    currentTime.value = timeFormat.format(now);
    currentDay.value = dayFormat.format(now);
  }

  void refreshDateTime() {
    getCurrentDateTime();
    update();
  }
}

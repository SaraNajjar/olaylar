import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class ReminderConrtoller extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    tz.initializeTimeZones();
    super.onInit();
  }

}
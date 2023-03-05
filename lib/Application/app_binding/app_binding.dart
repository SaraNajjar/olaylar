import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:olaylar/module/drawer/partner/partner_controller.dart';
import 'package:olaylar/module/event/event_controller.dart';
import 'package:olaylar/module/event/explore_event/explore_event_controller.dart';
import 'package:olaylar/module/splash/splash_controller.dart';

import '../../module/contact_us/contact_us_controller.dart';
import '../../module/event/event_details/event_details_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(), fenix: true);
    Get.lazyPut(() => EventController(), fenix: true);
    Get.lazyPut(() => EventExplore(), fenix: true);
    Get.lazyPut(() => DetailsEventController(), fenix: true);
    Get.lazyPut(() => PartnerController(), fenix: true);
    Get.lazyPut(() => ContactController(), fenix: true);

  }
}
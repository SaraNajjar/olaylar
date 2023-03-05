import 'dart:async';
import 'package:get/get.dart';
import 'package:olaylar/module/event/event_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await startDelay();
    super.onInit();
  }

  Timer? _timer;
  startDelay() {
    _timer = Timer(Duration(seconds: 5), _goNext);
  }

  _goNext() {
    Get.off(()=>EventScreen());
  }
}
import 'package:get/get.dart';
import 'package:olaylar/Api/Repo/details_event_repo.dart';
import 'package:olaylar/model/details_event.dart';

class DetailsEventController extends GetxController{

  var isLoadingRequest = false;

  TDetailsEvent? tDetailsEvent;

  getDetailsEvent(int id) async {
    try {
      isLoadingRequest = true;
      update();
      tDetailsEvent = await DetailsEventRepo.instance.EventDetailsRequest(id);
      update();
      isLoadingRequest = false;
      update();
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
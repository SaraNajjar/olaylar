import 'package:get/get.dart';
import 'package:olaylar/Api/Repo/get_event_repo.dart';
import 'package:olaylar/model/event.dart';

class EventController extends GetxController{

  var isLoadingRequest = false;

   TEvent? tEvent;


  getEvent() async {
    try {
      isLoadingRequest = true;
      update();
      tEvent = await getEventRepo.instance.getEventRequest();
      update();
      isLoadingRequest = false;
      update();
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    await getEvent();
    super.onInit();
  }
}
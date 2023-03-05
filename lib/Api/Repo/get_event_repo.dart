
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:olaylar/Api/controller/get_event_controller.dart';
import 'package:olaylar/model/event.dart';

class getEventRepo{
  static var instance = getEventRepo();
  TEvent? tEvent;
  Future<TEvent> getEventRequest() async{
    Response response;
    try {
      response = await getEventController.getEvent();

      if (response.statusCode == 200) {
        tEvent = TEvent.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {
      print(error.toString());
    }
    return tEvent!;
  }

}
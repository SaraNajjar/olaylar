
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:olaylar/Api/controller/details_event_controller.dart';
import 'package:olaylar/Api/controller/get_event_controller.dart';
import 'package:olaylar/model/details_event.dart';
import 'package:olaylar/model/event.dart';

class DetailsEventRepo{
  static var instance = DetailsEventRepo();
  TDetailsEvent? tDetailsEvent;
  Future<TDetailsEvent> EventDetailsRequest(int id) async{
    Response response;
    try {
      response = await DetailsEventController.getDetailsEvent(id);

      if (response.statusCode == 200) {
        tDetailsEvent = TDetailsEvent.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {
      print(error.toString());
    }
    return tDetailsEvent!;
  }

}
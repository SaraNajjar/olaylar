
import 'package:dio/dio.dart';
import 'package:olaylar/Api/constant.dart';
import 'package:olaylar/Api/dio.dart';

class DetailsEventController{

  static Future<Response>  getDetailsEvent(int id) {
    return DioHelper().get(
        Constant.eventDetailsUrl(id: id));
  }
}
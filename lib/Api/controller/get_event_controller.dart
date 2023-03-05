
import 'package:dio/dio.dart';
import 'package:olaylar/Api/constant.dart';
import 'package:olaylar/Api/dio.dart';

class getEventController{

  static Future<Response>  getEvent() {
    return DioHelper().get(
        Constant.getEventUrl);
  }
}
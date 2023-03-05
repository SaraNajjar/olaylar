
import 'package:dio/dio.dart';
import 'package:olaylar/Api/constant.dart';
import 'package:olaylar/Api/dio.dart';

class getpartnerController{

  static Future<Response>  getPartner() {
    return DioHelper().get(
        Constant.getPartnerUrl);
  }
}
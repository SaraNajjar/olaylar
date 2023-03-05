
import 'package:dio/dio.dart';
import 'package:olaylar/Api/constant.dart';
import 'package:olaylar/Api/dio.dart';


class ContactController{

  static Future<Response> postcontact(
      {
        required String fullname,
        required String email,
        required String mobile,
        required String comment,
      }) {

    return DioHelper().post(
        Constant.ContactUrl,
        data: {
          "fullname": fullname,
          "email": email,
          "mobile": mobile,
          "comment": comment,
        });
  }
}

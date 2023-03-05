import 'package:dio/dio.dart';
import 'package:olaylar/model/partner.dart';
import 'package:olaylar/Api/controller/contact_controller.dart';
class ContactRepo {

  static var instance = ContactRepo();

  TPartner? tPartner;

  Future<TPartner> postContact(
      {
        required String fullname,
        required String email,
        required String mobile,
        required String comment,
      }) async {
    Response response;
    try {
      response = await ContactController.postcontact(
          fullname: fullname,
          email: email,
          mobile: mobile,
          comment: comment
      );
      if (response.statusCode == 200) {
        tPartner = TPartner.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {
      print(error.toString());
    }

    return tPartner!;
  }
}

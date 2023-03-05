

import 'package:dio/dio.dart';
import 'package:olaylar/Api/controller/partner_controller.dart';
import 'package:olaylar/model/partner.dart';

class getPartnerRepo{
  static var instance = getPartnerRepo();

  TPartner? tPartner;

  Future<TPartner> getPartnerRequest() async{

    Response response;
    try {
      response = await getpartnerController.getPartner();

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
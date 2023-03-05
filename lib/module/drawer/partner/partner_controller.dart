import 'package:get/get.dart';
import 'package:olaylar/Api/Repo/partner_repo.dart';
import 'package:olaylar/model/partner.dart';

class PartnerController extends GetxController{

  var isLoadingRequest = false;

  TPartner? tPartner;


  getPartner() async {
    try {
      isLoadingRequest = true;
      update();
      tPartner = await getPartnerRepo.instance.getPartnerRequest();
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
    await getPartner();
    super.onInit();
  }
}
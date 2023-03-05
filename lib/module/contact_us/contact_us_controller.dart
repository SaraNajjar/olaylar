

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olaylar/Api/Repo/contact_repo.dart';
import 'package:olaylar/model/partner.dart';

class ContactController extends GetxController{

  late TextEditingController
      fullNameController ,
      emailController ,
      mobileController ,
      commentController ;
  @override
  void onInit() {
    fullNameController = TextEditingController() ;
    emailController = TextEditingController();
    mobileController = TextEditingController();
    commentController = TextEditingController();
    super.onInit();
  }

  bool isLoadingRequest = false;

  Future<void> postContact() async {
    try {
      isLoadingRequest = true;
      update();
      TPartner tPartner = await ContactRepo.instance.postContact(
          fullname: fullNameController.text,
          email: emailController.text,
          mobile: mobileController.text,
          comment: commentController.text
      );
      if (tPartner.status!) {
        Get.snackbar(
          '', 'sent succesfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
      } else {
        Get.snackbar(
          '', '${tPartner.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
      reset();
      isLoadingRequest = false;
      update();
    } catch (error) {

    }
  }
  void reset(){
    fullNameController.clear();
    emailController.clear();
    mobileController.clear();
    commentController.clear();
    update();

  }
}
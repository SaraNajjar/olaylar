import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:olaylar/Api/Repo/add_event_repo.dart';
import 'package:olaylar/model/add_event.dart';
import 'package:permission_handler/permission_handler.dart';

class addEventController extends GetxController{


  int categoryIndex = 0;

  void changeCategoryType({required int index}) {
    categoryIndex = index;
    update();
  }

  late TextEditingController
      name_enController ,
      name_trController ,
      name_arController ,
      fromdtController ,
      todtController ,
      fromtmController ,
      totmController ,
      locationController ,
      description_enController,
      emailController,
      mobileController,
      websiteController,
      facebookController,
      twitterController,
      instController,
      description_trController,
      description_arController;

  var selectedfromDate = DateTime.now().obs;
  var selectedtoDate = DateTime.now().obs;

  Future choosefromDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate:selectedfromDate.value ,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    );
    if(pickedDate!=null&&pickedDate!=selectedfromDate.value)
      selectedfromDate.value=pickedDate;
  }

  Future chooseToDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate:selectedtoDate.value ,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
    );
    if(pickedDate!=null&&pickedDate!=selectedtoDate.value)
      selectedtoDate.value=pickedDate;
  }

  var selectedFromTime=TimeOfDay.now().obs;

  Future choosefromTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime:selectedFromTime.value ,

    );
    if(pickedTime!=null&&pickedTime!=selectedfromDate.value)
      selectedFromTime.value=pickedTime;
  }
  var selectedToTime=TimeOfDay.now().obs;

  Future chooseToTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime:selectedToTime.value ,

    );
    if(pickedTime!=null&&pickedTime!=selectedfromDate.value)
      selectedToTime.value=pickedTime;
  }


  @override
  void onInit() {
    name_enController = TextEditingController() ;
    name_trController = TextEditingController() ;
    name_arController = TextEditingController() ;
    description_enController = TextEditingController();
    description_trController = TextEditingController();
    description_arController = TextEditingController();
    locationController = TextEditingController();
    fromdtController = TextEditingController();
    todtController = TextEditingController();
    fromtmController = TextEditingController();
    totmController =TextEditingController();
    emailController = TextEditingController();
    mobileController = TextEditingController();
    websiteController = TextEditingController();
    facebookController = TextEditingController();
    twitterController = TextEditingController();
    instController = TextEditingController();
    super.onInit();
  }

  getPermission() async{
    if( await Permission.location.isGranted){

    }else{
      Permission.location.request();
    }
  }

  LocationData? locationData;

  void getLocation() async{
    locationData = await Location.instance.getLocation();
  }

      bool isLoadingRequest = false;


  Future<void> postEvent() async {
    try {
      isLoadingRequest = true;
      update();
      TAddEvent tAds = await AddEventRepo.instance.postEvent(

          title_ar: name_arController.text,
          title_en: name_enController.text,
          title_tr: name_trController.text,
          description_ar: description_arController.text,
          description_en: description_enController.text,
          description_tr: description_trController.text,
          image: img.value,
          date_from: selectedfromDate.value.toString(),
          date_to: selectedtoDate.value.toString(),
          time_from: selectedFromTime.value.toString(),
          time_to: selectedToTime.value.toString(),
          email: emailController.text,
          mobile: mobileController.text,
          address: locationController.text,
          facebook: facebookController.text,
          twitter: twitterController.text,
          instagram: instController.text,
          website: websiteController.text,
          message: ''
      );
      if (tAds.status!) {
        Get.snackbar(
          '', '${'Added Successfully'}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
        );
      } else {
        Get.snackbar(
          '', '${tAds.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
      reset();
      isLoadingRequest = false;
      update();
    } catch (error) {
      print(error.toString());
    }
  }
  var img = ''.obs;

  void pickImage() async {
    XFile? image = await ImagePicker().pickImage(source:ImageSource.gallery);
    if (image!=null) {
      img.value = image.path;
      update();
    }

  }
  Future<Uint8List?> convertImage(String path) async {
    img = (await File(path).readAsBytes()) as RxString;
    var codec = await ui.instantiateImageCodec(img as Uint8List);
    var frame = await codec.getNextFrame();

    var pictureRecorder = ui.PictureRecorder();
    var canvas = Canvas(pictureRecorder );
    canvas.drawImage( frame.image, Offset.zero, Paint() );
    var picture = pictureRecorder.endRecording();

    var image = await picture.toImage( frame.image.width, frame.image.height );
    var pngBytes = await image.toByteData( format: ui.ImageByteFormat.png );
    return pngBytes?.buffer.asUint8List();
  }

  void reset(){
    name_enController.clear();
    name_trController.clear();
    name_arController.clear();
    description_arController.clear();
    description_enController.clear();
    description_trController.clear();
    locationController.clear();
    fromdtController.clear();
    todtController.clear();
    selectedFromTime.value.toString().trim();
    selectedToTime.value.toString().trim();
    selectedfromDate.value.toString().trim();
    selectedtoDate.value.toString().trim();
    emailController.clear();
    mobileController.clear();
    websiteController.clear();
    facebookController.clear();
    twitterController.clear();
    instController.clear();
    update();

  }
}
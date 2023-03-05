import 'package:dio/dio.dart';
import 'package:olaylar/Api/controller/add_event_controller.dart';
import 'package:olaylar/model/add_event.dart';
class AddEventRepo {

  static var instance = AddEventRepo();

  TAddEvent? tAddEvent;

  Future<TAddEvent> postEvent(
      {
        required String title_ar,
        required String title_en,
        required String title_tr,
        required String description_ar,
        required String description_en,
        required String description_tr,
        required String image,
        required String date_from,
        required String date_to,
        required String time_from,
        required String time_to,
        required String email,
        required String mobile,
        required String address,
        required String facebook,
        required String twitter,
        required String instagram,
        required String website,
        required String message,
      }) async {
    Response response;
    try {
      response = await AddEventController.addEvent(
          title_ar: title_ar,
          title_en: title_en,
          title_tr: title_tr,
          description_ar: description_ar,
          description_en: description_en,
          description_tr: description_tr,
          image: image,
          date_from: date_from,
          date_to: date_to,
          time_from: time_from,
          time_to: time_to,
          email: email,
          mobile: mobile,
          address: address,
          facebook: facebook,
          twitter: twitter,
          instagram: instagram,
          website: website,
          message: message
      );
      if (response.statusCode == 200) {
        tAddEvent = TAddEvent.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {
      print(error.toString());
    }

    return tAddEvent!;
  }
}


import 'package:dio/dio.dart';
import 'package:olaylar/Api/constant.dart';
import 'package:olaylar/Api/dio.dart';

class CategoryController{

  static Future<Response>  getCategory() {
    return DioHelper().get(
        Constant.CategoryUrl);
  }
}
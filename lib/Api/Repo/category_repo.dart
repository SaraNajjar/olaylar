

import 'package:dio/dio.dart';
import 'package:olaylar/Api/controller/category_controller.dart';
import 'package:olaylar/model/category.dart';

class getCategoryRepo{

  static var instance = getCategoryRepo();

  TCategory? tCategory;

  Future<TCategory> getCategoryRequest() async{

    Response response;

    try {
      response = await CategoryController.getCategory();

      if (response.statusCode == 200) {
        tCategory = TCategory.fromJson(response.data);
        print(response.data);
      }
    } catch (error) {
      print(error.toString());
    }
    return tCategory!;
  }

}
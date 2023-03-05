

import 'package:dio/dio.dart';

import 'constant.dart';

Dio DioHelper({Map<String,dynamic>?headers}){

  Dio dio = Dio();
  dio.options.receiveTimeout =4000 ;
  dio.options.connectTimeout = 5000 ;

  dio.options.headers = headers;
  dio.interceptors.add(
      LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      request: true,
      requestHeader: false,
      responseHeader: false,
  ));
  dio.options.baseUrl = Constant.baseUrl;
  return dio;

}
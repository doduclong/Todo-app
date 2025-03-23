import 'dart:convert';

import 'package:dio/dio.dart';

class $MyDioException {
  const $MyDioException();

  String getMessage(DioException e){
    String? messageCustom;
    try {
      messageCustom =  json.decode(e.response!.data as String)['message'].toString();
    } catch (e) {
      print(e);
    }
    return "${messageCustom ?? e.message ?? ""} (${e.response?.statusMessage} ${e.response?.statusCode})";
  }

}

import 'dart:io';

import 'package:storage_core/exception/exception.dart';
import 'package:dio/dio.dart';

class MyDio {
  Dio? dio;

  void setUp({required String baseUrl, int receiveTimeout = 30, int connectTimeout = 30}){
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: Duration(seconds: receiveTimeout),
      connectTimeout: Duration(seconds: connectTimeout),
      responseType: ResponseType.plain,
    ),);
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler  handler) async {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler  handler) async {
          return handler.next(response);
        },
        onError: (DioException  e, ErrorInterceptorHandler   handler) async {
          return handler.next(e);
        },
      ),
    );
  }


  Future<dynamic> get(String url, {
    Map<String, dynamic>? queryParameters,
    String? accessToken,
  }) async {
    try {
      if (accessToken != null) {
        dio!.options.headers["authorization"] = accessToken;
      }

      final response = await dio!.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          headers: {...dio!.options.headers, },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      throw MyException.dio.getMessage(e);
    }
  }


  Future<dynamic> post(String url, {required dynamic body, String? accessToken,}) async {
    try {
      if (accessToken != null) {
        dio!.options.headers["authorization"] = accessToken;
      }

      final response = await dio!.post(
        url,
        data: body,
        options: Options(
          headers: {...dio!.options.headers , },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      throw MyException.dio.getMessage(e);
    }
  }

  Future<dynamic> put(String url, {required dynamic body, String? accessToken,}) async {
    try {
      if (accessToken != null) {
        dio!.options.headers["authorization"] = accessToken;
      }

      final response = await dio!.put(
        url,
        data: body,
        options: Options(
          headers: {...dio!.options.headers, },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      throw MyException.dio.getMessage(e);
    }
  }

  /// Hiện tại chỉ hoạt động với giá trị là đường dẫn của ảnh (path Image)
  Future<FormData> getFormData(Map<String, dynamic> map, {List<String> fileKeys = const  [], String isInAssets = 'assets/'}) async{
     if(fileKeys.isNotEmpty) {
       for (final fileKey in fileKeys) {
         map[fileKey] = (map[fileKey] as String).contains(isInAssets)
             ? MultipartFile.fromBytes(File(map[fileKey] as String).readAsBytesSync() , filename: fileKey)
             : await MultipartFile.fromFile(map[fileKey] as String);
       }
     }
     return FormData.fromMap(map);
  }


}

import 'package:storage_core/src.dart';

class MyException {
  MyException._();

  static const $MyDioException dio = $MyDioException();
  static const $MyGraphqlException graphql = $MyGraphqlException();

}
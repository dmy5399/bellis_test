import 'package:dio/dio.dart';

class DioSingleton {
  static final DioSingleton _instance = DioSingleton._internal();
  static var _dio;

  factory DioSingleton() {
    DioSingleton._dio ??= Dio();
    return _instance;
  }

  Dio instance() {
    return _dio;
  }

  DioSingleton._internal();
}
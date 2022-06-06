import 'package:dio/dio.dart';
import 'package:flutter_auth/di/di.dart';

import '../../../data.dart';

class DioClient {
  String baseUrl = "https://reqres.in";

  String? _auth;
  bool _isUnitTest = false;
  late Dio _dio;

  DioClient({bool isUnitTest = false}) {
    _isUnitTest = isUnitTest;
    try {
      _auth = sl<PrefManager>().token;
    } catch (_) {}
    _dio = _createDio();
    if (!_isUnitTest) _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio {
    if (_isUnitTest) {
      return _dio;
    } else {
      try {
        _auth = sl<PrefManager>().token;
      } catch (_) {}
      final _dio = _createDio();
      if (!_isUnitTest) _dio.interceptors.add(DioInterceptor());
      return _dio;
    }
  }

  Dio _createDio() => Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        if (_auth != null) ...{
          "Authorization": _auth,
        }
      },
      receiveTimeout: 60000,
      connectTimeout: 60000,
      validateStatus: (int? status) {
        return status! > 0;
      }));

  Future<Response> getRequest(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(url, queryParameters: queryParameters);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> postRequest(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      return await dio.post(url, data: data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}

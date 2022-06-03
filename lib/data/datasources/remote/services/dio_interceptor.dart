import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String headerMessage = "";
    options.headers.forEach((key, value) => headerMessage += '► $key: $value\n');
    try{
      options.queryParameters.forEach((key, value) => debugPrint('► $key: $value\n'),);
    }catch(_){}
    try{
      const JsonEncoder encoder = JsonEncoder.withIndent(" ");
      final String prettyJson = encoder.convert(options.data);
      log.d()
    }catch(_){}
    super.onRequest(options, handler);
  }
}
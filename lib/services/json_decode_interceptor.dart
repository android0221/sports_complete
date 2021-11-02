import 'dart:convert';

import 'package:dio/dio.dart';

class JsonDecodeInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data is String) {
      response.data = jsonDecode(response.data);
    }
    super.onResponse(response, handler);
  }
}

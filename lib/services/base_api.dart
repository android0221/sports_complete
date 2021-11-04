import 'package:dio/dio.dart';

abstract class BaseApi {
  final List<Interceptor>? interceptors;

  late final Dio _dio;

  BaseApi({this.interceptors}) {
    _dio = Dio(
      BaseOptions(
        receiveTimeout: 10000,
        connectTimeout: 10000,
        headers: {
          'user-agent':
              'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1',
        },
      ),
    );
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors!);
    }
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? parameters,
  }) async {
    return _request(path, parameters: parameters, method: 'GET');
  }

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? parameters,
  }) async {
    return _request(path, data: data, parameters: parameters, method: 'POST');
  }

  Future<dynamic> _request(
    String path, {
    required String method,
    Map<String, dynamic>? data,
    Map<String, dynamic>? parameters,
  }) async {
    Response response;

    try {
      response = await _dio.request(
        path,
        data: data,
        queryParameters: parameters,
        options: Options(method: method.toUpperCase()),
      );
    } on DioError catch (e) {
      var message = e.message;
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        message = '网络连接异常';
      } else if (e.type == DioErrorType.other) {
        message = '请检查您的网络连接';
      } else {
        message = '服务暂不可用';
      }
      onRequestFailed(message);
      return;
    }

    return onRequestSuccess(response.data);
  }

  dynamic onRequestSuccess(dynamic data);
  void onRequestFailed(dynamic data);
}

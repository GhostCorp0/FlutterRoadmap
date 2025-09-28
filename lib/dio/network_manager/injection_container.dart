import 'dart:convert';
import 'package:dio/dio.dart';


Dio getDio() {
  Dio dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options,handler) {
        return handler.next(options);
      },

      onResponse: (Response response,ResponseInterceptorHandler handler) {
        return handler.next(response);
      },

      onError: (DioException e,handler) {
        return handler.next(e);
      }
    )
  );
  return dio;
}
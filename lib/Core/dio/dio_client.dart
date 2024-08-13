// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:empco/Core/dio/app_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const baseUrl = 'http://10.0.2.2:8000/';

@singleton
class DioClient {
  factory DioClient() {
    return _instance;
  }

  DioClient._() {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
    );

    _dio = Dio(baseOptions);
    _dio.interceptors.add(AppInterceptor());
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        maxWidth: 98,
        compact: true,
        logPrint: dioPrint,
      ),
    );
  }

  static final DioClient _instance = DioClient._();

  late final Dio _dio;

  Future<Response<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    return _dio.get(
      endpoint,
      queryParameters: queries,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.post(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.put(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.delete(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }
}

void dioPrint(Object object) {
  debugPrint(object.toString());
}

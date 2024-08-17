// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:empco/Core/dio/app_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//const baseUrl = 'http://10.0.2.2:8000/';
const baseUrl = 'http://192.168.22.198:8000/';

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
      options: Options(headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODc3NTYwYjA0OWRlYWVlZGM2NjhiOTk5OTI3YmEzYWRhZDgxNGE3MzZjYmJiYjQ3ZjczNGRkZjE1ZjhlMjJlNjliZDU3MDJlYWZkM2IxNjUiLCJpYXQiOjE3MjM4OTU1NTYuNDQ5NDY3LCJuYmYiOjE3MjM4OTU1NTYuNDQ5NDcsImV4cCI6MTc1NTQzMTU1Ni40NDAzNDMsInN1YiI6IjIyIiwic2NvcGVzIjpbIm93bmVyIl19.Y7Et7IOSEejHn4e5LjPXfAMG8Pwp15T3SG1VPBN2_sd9k9vI6xvnFLG63g0BgryO6bjNnJdezYp0cbOC-Uclfo3vxuLXE_F76f1HZ7fhaohAQbSeqWWteu72YvohUAfEIgqYuwxx5CnQP0tPDvpocA2Vy1pfX1bn4h2byLn41GTyfQ6a7FmgOpMQ8A7JpZQjYgHkD0qZCyazfHJAoT94dpW9DYCeohKgNdKN-ziZ46t9BIlNCDMVuW6wmqqed-z9XyWG4rE81OPmVIZGUjT1Lr-mCV1gbX5Q2G8peN5isGubxd-iOvVyz1m-AV-MpA0Wz8sR_v9Za4iYzDkT5mJHejhOg2tkP4zaplI7KhdeWAbk7LYaUb8gp_UQOB3l353_uuW9-0eCXi08IampXzT61FopF9IRQot4OB3MpqsbHmV3ZIROlAVE3fzZGoMgOER465fNUc-QSp3SndCbLnVGeUCxa8s7IVoW88GiqeNaYAxT9e52xGUuxScFNMgR-CpDhds6apR6eTLX7WXoY4et0Mfi8Ce3KIbOF6NWg9FrtOMl36fBIrt1htt5Ux7ZjMFXmcfZ0k_7wyJLtXbI5z77LUGma39JrXHZ6acNnf6ugvl3ktivG6kzADvdlHEiCfHOoMc-p8gKhQQTKeE_7t25qRJ50GDIsIfRIF58H9yyMeQ"
      }),
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
      options: Options(headers: {
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODc3NTYwYjA0OWRlYWVlZGM2NjhiOTk5OTI3YmEzYWRhZDgxNGE3MzZjYmJiYjQ3ZjczNGRkZjE1ZjhlMjJlNjliZDU3MDJlYWZkM2IxNjUiLCJpYXQiOjE3MjM4OTU1NTYuNDQ5NDY3LCJuYmYiOjE3MjM4OTU1NTYuNDQ5NDcsImV4cCI6MTc1NTQzMTU1Ni40NDAzNDMsInN1YiI6IjIyIiwic2NvcGVzIjpbIm93bmVyIl19.Y7Et7IOSEejHn4e5LjPXfAMG8Pwp15T3SG1VPBN2_sd9k9vI6xvnFLG63g0BgryO6bjNnJdezYp0cbOC-Uclfo3vxuLXE_F76f1HZ7fhaohAQbSeqWWteu72YvohUAfEIgqYuwxx5CnQP0tPDvpocA2Vy1pfX1bn4h2byLn41GTyfQ6a7FmgOpMQ8A7JpZQjYgHkD0qZCyazfHJAoT94dpW9DYCeohKgNdKN-ziZ46t9BIlNCDMVuW6wmqqed-z9XyWG4rE81OPmVIZGUjT1Lr-mCV1gbX5Q2G8peN5isGubxd-iOvVyz1m-AV-MpA0Wz8sR_v9Za4iYzDkT5mJHejhOg2tkP4zaplI7KhdeWAbk7LYaUb8gp_UQOB3l353_uuW9-0eCXi08IampXzT61FopF9IRQot4OB3MpqsbHmV3ZIROlAVE3fzZGoMgOER465fNUc-QSp3SndCbLnVGeUCxa8s7IVoW88GiqeNaYAxT9e52xGUuxScFNMgR-CpDhds6apR6eTLX7WXoY4et0Mfi8Ce3KIbOF6NWg9FrtOMl36fBIrt1htt5Ux7ZjMFXmcfZ0k_7wyJLtXbI5z77LUGma39JrXHZ6acNnf6ugvl3ktivG6kzADvdlHEiCfHOoMc-p8gKhQQTKeE_7t25qRJ50GDIsIfRIF58H9yyMeQ"
      }),
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

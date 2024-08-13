import 'package:dio/dio.dart';
import 'package:empco/Core/di/di.dart';
import 'package:empco/Core/dio/exceptions.dart';
import 'package:empco/Core/repos/user_repo.dart';
import 'package:empco/Core/utils/logger.dart';
import 'package:empco/Features/auth_manager/bloc/auth_manager_bloc.dart';
import 'package:flutter/cupertino.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = 'application/json';

    final userRepo = config<UserRepo>();
    if (userRepo.isSignedIn) {
      options.headers['Authorization'] = 'Bearer ${userRepo.user?.token}';
      debugPrint('Bearer ${userRepo.user?.token}');
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.f(
      'Message: ${err.message}\n'
      'Error${err.error}\n'
      'Status code: ${err.response?.statusCode}\n'
      'Type: ${err.type}\n'
      'Response: ${err.response?.data}',
    );

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.connectionError:
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(
              requestOptions: err.requestOptions,
              response: err.response,
              message: (err.response?.data as Map<String, dynamic>? ??
                  {})['message'] as String?,
            );
          case 401:
            //TODO: We should handle this in a different way.
            config<AuthenticationBloc>().add(SignOutRequested());
            throw UnauthorizedException(err.requestOptions);
          case 403:
            throw AccessForbiddenException(err.requestOptions);
          case 404:
            throw NotFoundException(
              requestOptions: err.requestOptions,
              response: err.response,
              message: (err.response?.data as Map<String, dynamic>? ??
                  {})['message'] as String?,
            );
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
      case DioExceptionType.cancel:
        throw CancelledException(err.requestOptions);
      case DioExceptionType.badCertificate:
        throw BadCertificateException(err.requestOptions);
      case DioExceptionType.unknown:
        throw BadResponseException(err.requestOptions);
    }

    return handler.next(err);
  }
}

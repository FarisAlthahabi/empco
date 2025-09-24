import 'package:dio/dio.dart';

class BadRequestException extends DioException {
  BadRequestException({
    required super.requestOptions,
    super.response,
    super.message,
  });

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException({
    required super.requestOptions,
    super.response,
    super.message,
  });

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}

class AccessForbiddenException extends DioException {
  AccessForbiddenException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'This request is forbidden';
  }
}

class UnknownException extends DioException {
  UnknownException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'Unknown exception.';
  }
}

class CancelledException extends DioException {
  CancelledException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'The request is cancelled.';
  }
}

class BadCertificateException extends DioException {
  BadCertificateException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'Incorrect certificate.';
  }
}

class BadResponseException extends DioException {
  BadResponseException(RequestOptions requestOptions)
      : super(requestOptions: requestOptions);

  @override
  String toString() {
    return 'Incorrect status code.';
  }
}

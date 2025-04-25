import 'package:dio/dio.dart';

import 'exception_model.dart';

class ServerException implements Exception {
  final ExceptionModel exceptionModel;

  ServerException({required this.exceptionModel});
}

exceptionSwitch(DioException e) {
  ExceptionModel exceptionModel = ExceptionModel.fromJson(e.response!.data);

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(exceptionModel: exceptionModel);
    case DioExceptionType.sendTimeout:
      throw ServerException(exceptionModel: exceptionModel);
    case DioExceptionType.receiveTimeout:
      throw ServerException(exceptionModel: exceptionModel);
    case DioExceptionType.badCertificate:
      throw ServerException(exceptionModel: exceptionModel);
    case DioExceptionType.badResponse:
      throw ServerException(exceptionModel: exceptionModel);
    case DioExceptionType.cancel:
      throw ServerException(exceptionModel: exceptionModel);
    case DioExceptionType.connectionError:
      throw ServerException(exceptionModel: exceptionModel);
    case DioExceptionType.unknown:
      switch (e.response!.statusCode) {
        case 400:
          throw ServerException(exceptionModel: exceptionModel);
        case 401:
          throw ServerException(exceptionModel: exceptionModel);
        case 403:
          throw ServerException(exceptionModel: exceptionModel);
        case 404:
          throw ServerException(exceptionModel: exceptionModel);
        case 409:
          throw ServerException(exceptionModel: exceptionModel);
        case 422:
          throw ServerException(exceptionModel: exceptionModel);
        case 504:
          throw ServerException(exceptionModel: exceptionModel);
      }
  }
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class APIException implements Exception {
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.sendTimeout:
          return APIException(message: 'no internet');
        case DioExceptionType.connectionTimeout:
          return APIException(message: 'connectionTimeout');
        case DioExceptionType.badResponse:
          print(error.error);
          return APIException(
              message: error.response?.data['Message'] ?? 'Bad Response');
        default:
          return APIException(message: 'something went wrong');
      }
    } else {
      return APIException(message: 'Something went wrong');
    }
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError(APIException? error) {
    Get.rawSnackbar(message: error?.message ?? 'Something went wrong');
  }
}

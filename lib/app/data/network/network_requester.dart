import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/utils/helper/exception_handler.dart';

class NetworkRequester {
  late Dio _dio;
  late Dio _formDio;

  NetworkRequester() {
    prepareRequest();
    prepareFormRequest();
  }

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: Duration(seconds: 300),
      receiveTimeout: Duration(seconds: 300),
      baseUrl: URLs.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {'Accept': Headers.jsonContentType},
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    _dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      logPrint: _printLog,
    ));
  }

  void prepareFormRequest() {
    BaseOptions dioOptions = BaseOptions(
        connectTimeout: Duration(seconds: 300),
        receiveTimeout: Duration(seconds: 300),
        baseUrl: URLs.baseURL,
        contentType: "multipart/form-data",
        responseType: ResponseType.json);

    _formDio = Dio(dioOptions);

    _formDio.interceptors.clear();

    _formDio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: false,
      logPrint: _printLog,
    ));
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
    String? token, // Add a token parameter
  }) async {
    try {
      final options = Options(
        headers: {
          'Authorization':
              'Bearer $token', // Add the Bearer token to the headers
        },
      );

      final response =
          await _dio.get(path, queryParameters: query, options: options);
      return response.data;
    } on DioException catch (dioError) {
      return ExceptionHandler.handleError(dioError);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token, // Add a token parameter
  }) async {
    try {
      final options = Options(
        headers: {},
      );

      if (token != null) {
        options.headers?['Authorization'] = 'Bearer $token';
      }

      final response = await _dio.post(path,
          queryParameters: query, data: data, options: options);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      final options = Options(
        headers: {
          'Authorization':
              'Bearer $token', // Add the Bearer token to the headers
        },
      );

      final response = await _dio.put(path,
          queryParameters: query, data: data, options: options);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.patch(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: query, data: data);
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future downloadFile(
      {required String path,
      Map<String, dynamic>? query,
      var showDownloadProgress}) async {
    Dio dio = Dio();

    dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      )
    ]);
    try {
      Response response = await dio.get(
        path,
        queryParameters: query,
        onReceiveProgress: showDownloadProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      return response.data;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> download({
    required String url,
    required String savePath,
  }) async {
    Dio dio = Dio();
    try {
      final response = await dio.download(url, savePath);
      return response.data;
    } on Exception catch (exception) {
      return ExceptionHandler.handleError(exception);
    }
  }

  postFormData({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _formDio.post(
        path,
        data: FormData.fromMap(data!),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  putFormData({
    required String path,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _formDio.put(
        path,
        data: FormData.fromMap(data!),
      );
      return response.data;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioService {
  final Dio _dio = Dio();

  final baseUrl = "https://newsapi.org/v2/";

  final apiKey = "4ab677b4d3734bdd9ea279a4121ba4fa";

  DioService() {
    Dio(
      BaseOptions(baseUrl: baseUrl),
    );

    _initializeInterceptors();
  }

  Future<Response?> get(String endpoint, String category) async {
    final queryUrl = baseUrl + endpoint;

    Response? response;

    try {
      response = await (_dio.get(queryUrl, queryParameters: {
        "country": "ng",
        "category": category,
        "apiKey": apiKey
      }));
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw Exception(e.message);
    }
    return response;
  }

  _initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
      if (kDebugMode) {
        print("${request.method} ${request.baseUrl} ${request.path}");
      }
      return handler.next(request);
    }, onResponse: (response, handler) {
      if (kDebugMode) {
        print(response.data.toString());
      }
      return handler.next(response);
    }, onError: (error, handler) {
      if (kDebugMode) {
        print(error.message);
      }
      return handler.next(error);
    }));
  }
}

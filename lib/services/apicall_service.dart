import 'package:dio/dio.dart';
import 'package:naps_app/services/dio_service.dart';

class ApiCalls {
  DioService myDioService = DioService();

  final endpoint = "top-headlines";

  Future<List> getData(String category) async {
    Response? response = await myDioService.get(endpoint, category);

    if (response?.statusCode == 200) {
      final data = response?.data;

      return data;
    } else {
      throw "can't fetch data";
    }
  }
}

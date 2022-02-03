import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:naps_app/models/business_endpoint/article_model.dart';
import 'package:naps_app/models/business_endpoint/business_model.dart';
import 'package:naps_app/services/dio_service.dart';

class ApiCalls {
  DioService myDioService = DioService();

  final endpoint = "top-headlines";

  Future<List<Article?>> getData(String category) async {
    Response? response = await myDioService.get(endpoint, category);

    if (response?.statusCode == 200) {
      //final data = response?.data;

      //List<dynamic> data = (response?.data);

      // to return the list of users

      // List<Article> article =
      //     data.map((dynamic item) => Article.fromJson(item)).toList();

      Business article = Business.fromJson(response?.data);

      return article.articles;
    } else {
      throw "can't fetch data";
    }
  }
}

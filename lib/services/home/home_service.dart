import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_app/common/api/base_url.dart';
import 'package:news_app/common/api/endpoints.dart';
import 'package:news_app/model/home.dart';

class HomeService {
  Future<NewsModel?> getNew() async {
    Dio dio = Dio();
    try {
      final Response response =
          await dio.get(BaseUrl.baseUrl + ApiEndpoints.newsAndBlogs);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final NewsModel model = NewsModel.fromJson(response.data);
          log(model.toString());
          return model;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

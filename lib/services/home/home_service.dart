import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:news_app/common/api/base_url.dart';
import 'package:news_app/common/api/endpoints.dart';
import 'package:news_app/model/home.dart';
import 'package:news_app/model/new_list.dart';
import 'package:news_app/utils/exeptions/dio_exceptions.dart';

class HomeService {
  Future<NewsModel?> getNewsCategory() async {
    Dio dio = Dio();
    try {
      final Response response =
          await dio.get(BaseUrl.baseUrl + ApiEndpoints.newsAndBlogs);
      if (response.statusCode == 202) {
        if (response.data == null) {
          return null;
        } else {
          final NewsModel model = NewsModel.fromJson(response.data);
          log(model.toString());
          return model;
        }
      }
    } catch (e) {
      DioException().dioError(e);
      log(e.toString());
    }
    return null;
  }

  Future<NewList?> getNews(id) async {
    Dio dio = Dio();
    try {
      final Response response = await dio.post(
        BaseUrl.baseUrl + ApiEndpoints.newsAndBlogsCatg,
        data: {
          "category": id,
        },
      );
      if (response.statusCode == 200) {
        if (response.data == null) {
          return null;
        } else {
          final NewList model = NewList.fromJson(response.data);
          log(model.toString());
          return model;
        }
      }
    } catch (e) {
      DioException().dioError(e);
      log(e.toString());
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/model/home.dart';
import 'package:news_app/services/home/home_service.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getAllCategory();
  }

  bool isLoading = true;
  NewsModel? model;

  void getAllCategory() async {
    isLoading = true;
    notifyListeners();
    await HomeService().getNews().then((value) {
      if (value != null) {
        model = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
    return;
  }
}

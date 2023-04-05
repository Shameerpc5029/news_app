import 'package:flutter/material.dart';
import 'package:news_app/model/home.dart';
import 'package:news_app/model/new_list.dart';
import 'package:news_app/services/home/home_service.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    getAllCategory();
  }

  bool isLoading = false;
  NewsModel? model;
  NewList? newList;
  bool isLoading2 = false;

  final controller = ScrollController();

  void getAllCategory() async {
    isLoading = true;
    notifyListeners();
    await HomeService().getNewsCategory().then((value) {
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

  void getNews(id) async {
    isLoading = true;
    notifyListeners();
    await HomeService().getNews(id).then((value) {
      if (value != null) {
        newList = value;
        notifyListeners();
        isLoading2 = false;
        notifyListeners();
      } else {
        isLoading2 = false;
        notifyListeners();
      }
    });
    return;
  }

  void getNextNews(url,id) async {
    isLoading = true;
    notifyListeners();
    await HomeService().getNextNews(url,id).then((value) {
      if (value != null) {
        newList = value;
        notifyListeners();
        isLoading2 = false;
        notifyListeners();
      } else {
        isLoading2 = false;
        notifyListeners();
      }
    });
    return;
  }
}

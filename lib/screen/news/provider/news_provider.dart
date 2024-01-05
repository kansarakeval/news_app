import 'package:flutter/material.dart';
import 'package:news_app/screen/news/model/news_model.dart';
import 'package:news_app/util/api_helper.dart';

class NewsProvider with ChangeNotifier {
  String contrySelected = "in";
  String contryNews = "business";
  NewsModel? newsModel;

  Future<void> getNewsData() async {
    APIHelper apiHelper = APIHelper();
    NewsModel? new1 = await apiHelper.newsApiCall(contrySelected,contryNews);
    newsModel = new1;
    notifyListeners();
  }


  //contrySelected
  void changCountry(String country) {
    contrySelected = country;
    notifyListeners();
  }

  //contryNews
  void changNews(String news) {
    contryNews = news;
    notifyListeners();
  }
}
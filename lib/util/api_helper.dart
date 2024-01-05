import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/screen/news/model/news_model.dart';

class APIHelper {


  //news
  Future<NewsModel?> newsApiCall(String country,String category) async {
    String apiLink =
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=462c7412b507426585d7957aa32af462";

    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json =jsonDecode(response.body);
      NewsModel newsModel= NewsModel.mapToModel(json);
      return newsModel;
    }
    return null;
  }
}
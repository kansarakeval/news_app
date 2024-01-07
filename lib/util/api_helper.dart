import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/screen/apple/model/apple_model.dart';
import 'package:news_app/screen/news/model/news_model.dart';
import 'package:news_app/screen/tesla/model/tesla_model.dart';

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

  //apple
 Future<AppleNewsModel?> appleApiCall(String mobile) async {
    String apiLink = "https://newsapi.org/v2/everything?q=$mobile&from=2024-01-05&to=2024-01-05&sortBy=popularity&apiKey=462c7412b507426585d7957aa32af462";
    var response = await http.get(Uri.parse(apiLink));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      AppleNewsModel appleNews=AppleNewsModel.mapToModel(json);
      return appleNews;
    }
    return null;
 }

 //tesla
Future<TeslaNewsModel?> teslaApiCall(String tesla) async {
    String apiList ="https://newsapi.org/v2/everything?q=$tesla&from=2023-12-07&sortBy=publishedAt&apiKey=462c7412b507426585d7957aa32af462";
    var response = await http.get(Uri.parse(apiList));
    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      TeslaNewsModel teslaNews=TeslaNewsModel.mapToModel(json);
      return teslaNews;
    }
    return null;
}
}
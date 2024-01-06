import 'package:flutter/material.dart';
import 'package:news_app/screen/apple/model/apple_model.dart';
import 'package:news_app/util/api_helper.dart';

class AppleProvider with ChangeNotifier{
  AppleNewsModel? appleNewsModel;

  Future<void> getAppleData() async {
    APIHelper apiHelper=APIHelper();
    AppleNewsModel? apple1 = await apiHelper.appleApiCall();
    appleNewsModel = apple1;
    notifyListeners();
  }

}
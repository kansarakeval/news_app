import 'package:flutter/material.dart';
import 'package:news_app/screen/apple/model/apple_model.dart';
import 'package:news_app/util/api_helper.dart';

class AppleProvider with ChangeNotifier{
  String mobileSelected = "apple";
  AppleNewsModel? appleNewsModel;

  Future<void> getAppleData() async {
    APIHelper apiHelper=APIHelper();
    AppleNewsModel? apple1 = await apiHelper.appleApiCall(mobileSelected);
    appleNewsModel = apple1;
    notifyListeners();
  }

  //mobileSelected
void changMobile(String mobile){
    mobileSelected = mobile;
    notifyListeners();
}
}
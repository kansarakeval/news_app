import 'package:flutter/material.dart';
import 'package:news_app/screen/tesla/model/tesla_model.dart';
import 'package:news_app/util/api_helper.dart';

class TeslaProvider with ChangeNotifier{
  TeslaNewsModel? teslaNewsModel;
  String teslaSearch = 'tesla';

  void teslaSearchData(String search){
    teslaSearch=search;
    notifyListeners();
  }

  Future<void> getTeslaData() async {
    APIHelper apiHelper= APIHelper();
    TeslaNewsModel? tesla1 = await apiHelper.teslaApiCall(teslaSearch);
    teslaNewsModel = tesla1;
    notifyListeners();
  }
}
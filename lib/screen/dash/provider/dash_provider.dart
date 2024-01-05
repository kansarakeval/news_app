import 'package:flutter/material.dart';

class DashProvider with ChangeNotifier{
  int dashIndex=0;
  void changeIndex(int i1){
    dashIndex=i1;
    notifyListeners();
  }
}
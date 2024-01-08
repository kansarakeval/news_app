import 'package:flutter/material.dart';
import 'package:news_app/screen/apple/view/applenews_screen.dart';
import 'package:news_app/screen/dash/veiw/desh_screen.dart';
import 'package:news_app/screen/news/veiw/newsread_screen.dart';
import 'package:news_app/screen/splash/splash_screen.dart';
import 'package:news_app/screen/tesla/veiw/teslanews_screen.dart';

Map<String,WidgetBuilder> appRoutes={
  '/': (context) => const SplashScreen(),
  'dash': (context) => const DashScreen(),
  'newsread':(context) => const NewsReadScreen(),
  'applenews':(context) => const AppleNewsScreen(),
  'teslanews':(context) => const TeslaNewsScreen(),
};
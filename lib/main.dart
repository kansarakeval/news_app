import 'package:flutter/material.dart';
import 'package:news_app/screen/apple/provider/apple_provider.dart';
import 'package:news_app/screen/dash/provider/dash_provider.dart';
import 'package:news_app/screen/news/provider/news_provider.dart';
import 'package:news_app/screen/tesla/provider/tesla_provider.dart';
import 'package:news_app/util/app_routes.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DashProvider(),),
          ChangeNotifierProvider(create: (context) => NewsProvider(),),
          ChangeNotifierProvider(create: (context) => AppleProvider(),),
          ChangeNotifierProvider(create: (context) => TeslaProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: appRoutes,
        ),
      )
  );
}
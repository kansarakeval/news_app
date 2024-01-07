import 'package:flutter/material.dart';
import 'package:news_app/screen/apple/model/apple_model.dart';

class AppleNewsScreen extends StatefulWidget {
  const AppleNewsScreen({super.key});

  @override
  State<AppleNewsScreen> createState() => _AppleNewsScreenState();
}

class _AppleNewsScreenState extends State<AppleNewsScreen> {
  @override
  Widget build(BuildContext context) {
    AppleArticlesModel model =
    ModalRoute.of(context)!.settings.arguments as AppleArticlesModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.appleSourceModel!.name!),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: model.urlToImage ==null? Image.network(
                    "https://www.apple.com/newsroom/images/product/iphone/geo/apple_iphone-12_new-design_geo_10132020_big.jpg.large.jpg",
                    height: 200,
                    fit: BoxFit.cover,
                  )
                  :Image.network(
                      model.urlToImage!,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Author: ${model.author!}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10,),
                SizedBox(height: 10,),
                Text(
                  "Title: ${model.title!}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                SizedBox(height: 10,),
                Text(
                  "Description: ${model.description!}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                SizedBox(height: 10,),
                Text(
                  "content: ${model.content!}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                SizedBox(height: 10,),
                Text(
                  "content: ${model.publishedAt!}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

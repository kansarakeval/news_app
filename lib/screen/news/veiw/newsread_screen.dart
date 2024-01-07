import 'package:flutter/material.dart';
import 'package:news_app/screen/news/model/news_model.dart';

class NewsReadScreen extends StatefulWidget {
  const NewsReadScreen({Key? key}) : super(key: key);

  @override
  State<NewsReadScreen> createState() => _NewsReadScreenState();
}

class _NewsReadScreenState extends State<NewsReadScreen> {
  @override
  Widget build(BuildContext context) {
    ArticlesModel model =
        ModalRoute.of(context)!.settings.arguments as ArticlesModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.sourceModel!.name!),
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
                    child: model.urlToImage == null? Image.network(
                    "https://st.depositphotos.com/1006899/3776/i/450/depositphotos_37765339-stock-photo-news.jpg",
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
                Text(
                  "Title: ${model.title!}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                Divider(thickness: 1,color: Colors.black),
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

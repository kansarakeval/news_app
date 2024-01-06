import 'package:flutter/material.dart';
import 'package:news_app/screen/news/model/news_model.dart';
import 'package:news_app/screen/news/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsProvider? providerr;
  NewsProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<NewsProvider>().getNewsData();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<NewsProvider>();
    providerw = context.watch<NewsProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  country(name: "INDIA",nikname: "in"),
                  country(name: "USA",nikname: "us"),
                  country(name: "CANADA",nikname: "ca"),
                  country(name: "Australia",nikname: "au"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    category(name: "Business", nikname: "business"),
                    SizedBox(
                      width: 10,
                    ),
                    category(name: "Technology", nikname: "technology"),
                    SizedBox(
                      width: 10,
                    ),
                    category(name: "Entertainment", nikname: "entertainment"),
                    SizedBox(
                      width: 10,
                    ),
                    category(name: "Sports", nikname: "sports")
                  ],
                ),
              ),
            ),
            providerw!.newsModel == null
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Expanded(
              child: ListView.builder(
                itemCount: providerw!.newsModel!.articlesList!.length,
                itemBuilder: (context, index) {
                  ArticlesModel a1 = providerw!.newsModel!.articlesList![index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'newsread',arguments: a1);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      height: 110,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.grey.shade200,),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: providerw!.newsModel!
                                .articlesList![index].urlToImage ==
                                null
                                ? Image.network(
                              "https://media.istockphoto.com/id/1311148884/vector/abstract-globe-background.jpg?s=2048x2048&w=is&k=20&c=ZyHCcX0F_DVM-r_R_vG8OX_CqYLb-G16afTyaVGtB3o=",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            )
                                : Image.network(
                              "${providerw!.newsModel!.articlesList![index].urlToImage}",
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${providerw!.newsModel!.articlesList![index].sourceModel!.name}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "${providerw!.newsModel!.articlesList![index].description}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ActionChip country({required String name,required String nikname }) {
    return ActionChip(
      label: Text(name),
      onPressed: () {
        providerr!.changCountry(nikname);
        providerr!.getNewsData();
      },
    );
  }
  ActionChip category({required String name,required String nikname }) {
    return ActionChip(
      label: Text(name),
      onPressed: () {
        providerr!.changNews(nikname);
        providerr!.getNewsData();
      },
    );
  }
}
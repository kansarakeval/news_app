import 'package:flutter/material.dart';
import 'package:news_app/screen/tesla/model/tesla_model.dart';

class TeslaNewsScreen extends StatefulWidget {
  const TeslaNewsScreen({super.key});

  @override
  State<TeslaNewsScreen> createState() => _TeslaNewsScreenState();
}

class _TeslaNewsScreenState extends State<TeslaNewsScreen> {
  @override
  Widget build(BuildContext context) {
    TeslaArticlesModel model =
        ModalRoute.of(context)!.settings.arguments as TeslaArticlesModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.teslaSourceModel!.name!),
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
                    child: model.urlToImage == null
                        ? Image.network(
                            "https://www.topgear.com/sites/default/files/2022/03/TopGear%20-%20Tesla%20Model%20Y%20-%20003.jpg?w=976&h=549",
                            height: 200,
                      fit: BoxFit.cover,
                          )
                        : Image.network(
                            model.urlToImage!,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Author: ${model.author!}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Title: ${model.title!}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Description: ${model.description!}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "content: ${model.content!}",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
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

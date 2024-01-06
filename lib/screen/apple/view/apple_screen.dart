import 'package:flutter/material.dart';
import 'package:news_app/screen/apple/model/apple_model.dart';
import 'package:news_app/screen/apple/provider/apple_provider.dart';
import 'package:provider/provider.dart';

class AppleScreen extends StatefulWidget {
  const AppleScreen({Key? key}) : super(key: key);

  @override
  State<AppleScreen> createState() => _AppleScreenState();
}

class _AppleScreenState extends State<AppleScreen> {
  AppleProvider? providerr;
  AppleProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<AppleProvider>().getAppleData();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<AppleProvider>();
    providerw = context.watch<AppleProvider>();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Apple"),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mobile(name: "APPLE", nikname: 'apple'),
                      SizedBox(
                        width: 10,
                      ),
                      mobile(name: "SAMSUNG", nikname: 'samsung'),
                      SizedBox(
                        width: 10,
                      ),
                      mobile(name: "Vivo", nikname: 'vivo'),
                      SizedBox(
                        width: 10,
                      ),
                      mobile(name: "OPPO", nikname: 'oppo'),
                      SizedBox(
                        width: 10,
                      ),
                      mobile(name: "NOKIA", nikname: 'nokia'),
                      SizedBox(
                        width: 10,
                      ),
                      mobile(name: "MI", nikname: 'mi'),
                      SizedBox(
                        width: 10,
                      ),
                      mobile(name: "REALME", nikname: 'realme'),
                      SizedBox(
                        width: 10,
                      ),
                      mobile(name: "GOOGLE", nikname: 'google'),
                    ],
                  ),
                ),
              ),
              providerw!.appleNewsModel == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: providerw!
                            .appleNewsModel!.appleArticlesList!.length,
                        itemBuilder: (context, index) {
                          AppleArticlesModel a1 = providerw!
                              .appleNewsModel!.appleArticlesList![index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'applenews',
                                  arguments: a1);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(5),
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: providerw!
                                                .appleNewsModel!
                                                .appleArticlesList![index]
                                                .urlToImage ==
                                            null
                                        ? Image.network(
                                            "https://www.apple.com/newsroom/images/product/iphone/geo/Apple_iphone13_hero_geo_09142021_inline.jpg.large.jpg",
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.network(
                                            "${providerw!.appleNewsModel!.appleArticlesList![index].urlToImage}",
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${providerw!.appleNewsModel!.appleArticlesList![index].appleSourceModel!.name}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          "${providerw!.appleNewsModel!.appleArticlesList![index].title}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          "${providerw!.appleNewsModel!.appleArticlesList![index].description}",
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
          )),
    );
  }

  ActionChip mobile({required String name, required String nikname}) {
    return ActionChip(
      label: Text(name),
      onPressed: () {
        providerr!.changMobile(nikname);
        providerr!.getAppleData();
      },
    );
  }
}

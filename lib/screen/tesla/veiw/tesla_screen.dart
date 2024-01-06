import 'package:flutter/material.dart';
import 'package:news_app/screen/tesla/model/tesla_model.dart';
import 'package:news_app/screen/tesla/provider/tesla_provider.dart';
import 'package:provider/provider.dart';

class TeslaScreen extends StatefulWidget {
  const TeslaScreen({super.key});

  @override
  State<TeslaScreen> createState() => _TeslaScreenState();
}

class _TeslaScreenState extends State<TeslaScreen> {
  TeslaProvider? providerr;
  TeslaProvider? providerw;

  @override
  void initState() {
    super.initState();
    context.read<TeslaProvider>().getTeslaData();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<TeslaProvider>();
    providerw = context.watch<TeslaProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tesla"),
          centerTitle: true,
        ),
        body: providerw!.teslaNewsModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: providerw!.teslaNewsModel!.teslaArticlesList!.length,
                itemBuilder: (context, index) {
                  TeslaArticlesModel a1 = providerw!.teslaNewsModel!.teslaArticlesList![index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'teslanews',arguments: a1);
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
                            child: Image.network(
                              providerw!.teslaNewsModel!.teslaArticlesList![index]
                                          .urlToImage?.isEmpty ??
                                      true
                                  ? "https://emag.directindustry.com/wp-content/uploads/sites/3/model-3-tesla.jpg"
                                  : "${providerw!.teslaNewsModel!.teslaArticlesList![index].urlToImage}",
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  "https://emag.directindustry.com/wp-content/uploads/sites/3/model-3-tesla.jpg",
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${providerw!.teslaNewsModel!.teslaArticlesList![index].teslaSourceModel!.name}",
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "${providerw!.teslaNewsModel!.teslaArticlesList![index].title}",
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
                                  "${providerw!.teslaNewsModel!.teslaArticlesList![index].description}",
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
    );
  }
}

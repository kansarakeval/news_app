class TeslaNewsModel{
  String? status;
  int? totalResults;
  List<TeslaArticlesModel>? teslaArticlesList = [];

  TeslaNewsModel({this.status, this.totalResults, this.teslaArticlesList});

  factory TeslaNewsModel.mapToModel(Map m1){
    List l1 = m1['articles'];
    return TeslaNewsModel(
      status: m1['status'],
      totalResults: m1['totalResults'],
      teslaArticlesList: l1.map((e) => TeslaArticlesModel.mapToModel(e)).toList());
  }
}
class TeslaArticlesModel{
  String? author,title,description,url,urlToImage,publishedAt,content;
  TeslaSourceModel? teslaSourceModel;

  TeslaArticlesModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.teslaSourceModel});

  factory TeslaArticlesModel.mapToModel(Map m1){
    return TeslaArticlesModel(
      author: m1['author'],
      title: m1['title'],
      description: m1['description'],
      url: m1['url'],
      urlToImage: m1['urlToImage'],
      publishedAt: m1['publishedAt'],
      content: m1['content'],
      teslaSourceModel: TeslaSourceModel.mapToModel(m1['source']),
    );
  }
}
class TeslaSourceModel{
  dynamic id;
  String? name;

  TeslaSourceModel({this.id, this.name});

  factory TeslaSourceModel.mapToModel(Map m1){
    return TeslaSourceModel(
      id: m1['id'],
      name: m1['name'],
    );
  }
}
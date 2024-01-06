class AppleNewsModel {
  String? status;
  int? totalResults;
  List<AppleArticlesModel>? appleArticlesList = [];

  AppleNewsModel({this.status, this.totalResults, this.appleArticlesList});

  factory AppleNewsModel.mapToModel(Map m1){
    List l1 = m1['articles'];
    return AppleNewsModel(
      status: m1['status'],
      totalResults: m1['totalResults'],
      appleArticlesList: l1.map((e) => AppleArticlesModel.mapToModel(e)).toList(),
    );
  }
}

class AppleArticlesModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  AppleSourceModel? appleSourceModel; // Corrected property name

  AppleArticlesModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.appleSourceModel,
  });

  factory AppleArticlesModel.mapToModel(Map m1) {
    return AppleArticlesModel(
      author: m1['author'],
      title: m1['title'],
      description: m1['description'],
      url: m1['url'],
      urlToImage: m1['urlToImage'],
      publishedAt: m1['publishedAt'],
      content: m1['content'],
      appleSourceModel: AppleSourceModel.mapToModel(m1['source']),
    );
  }
}

class AppleSourceModel {
  dynamic id;
  String? name;

  AppleSourceModel({this.id, this.name});

  factory AppleSourceModel.mapToModel(Map m1) {
    return AppleSourceModel(
      id: m1['id'],
      name: m1['name'],
    );
  }
}

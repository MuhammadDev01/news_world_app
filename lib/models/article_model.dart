class ArticleModel {
  String? title;
  String? date;
  String? url;
  String? imageUrl;
  String? description;
  ArticleModel({
    required this.title,
    required this.date,
    required this.url,
    required this.imageUrl,
    required this.description,
  });

  factory ArticleModel.fromJson(data) {
    return ArticleModel(
      title: data['title'],
      date: data['publishedAt'],
      description: data['description'],
      url: data['url'],
      imageUrl: data['urlToImage'],
    );
  }
}

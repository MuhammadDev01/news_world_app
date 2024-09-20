import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  static Dio? dio;
  static final List<ArticleModel> articleList = [];
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<List<ArticleModel>> getNews({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    try {
      await dio!.get(url, queryParameters: {
        'apiKey': 'dab856b02cea463bb7429c1bb508b581',
        ...query,
      }).then((value) {
        Map<String, dynamic> jsonData = value.data;
        List<dynamic> articles = jsonData['articles'];
        for (var article in articles) {
          articleList.add(ArticleModel.fromJson(article));
        }
      });
    } catch (e) {
      throw Exception(e.toString());
    }

    return articleList;
  }
}

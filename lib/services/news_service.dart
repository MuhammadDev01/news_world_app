import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  static late Dio dio;
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
    List<ArticleModel> articleList = [];
    try {
      Response response = await dio.get(url, queryParameters: {
        'apiKey': 'dab856b02cea463bb7429c1bb508b581',
        ...query,
      });
      if (response.statusCode == 200) {
        List<dynamic> articles = response.data['articles'];
        for (var article in articles) {
          articleList.add(ArticleModel.fromJson(article));
        }
      }

      return articleList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

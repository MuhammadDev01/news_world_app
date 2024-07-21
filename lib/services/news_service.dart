import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio ;
  NewsService(this.dio);

//this apikey was expired 
String apiKey = 'a014ea55649843cfa5795a0aed6a90c0';
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articleList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          title: article['title'],
          subTitle: article['description'],
          image: article['urlToImage'],
        );
        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      debugPrint(
        'error : ${e.toString()}',
      );
      return [];
    }
  }
}

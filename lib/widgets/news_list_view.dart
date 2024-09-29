import 'package:flutter/material.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return articles == NewsCubit.get(context).generalArticles
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: articles.length,
              (context, index) => NewsItem(
                article: articles[index],
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => NewsItem(
              article: articles[index],
            ),
            itemCount: articles.length,
          );
  }
}

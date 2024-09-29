import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utils/app_style.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: article.imageUrl != null
                ? Image.network(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 220,
                    article.imageUrl!,
                  )
                : Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: Icon(
                      Icons.remove_circle,
                      size: 64,
                      color: Colors.red[900],
                    ),
                  ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Text(
                    article.title ?? 'No Title..!',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.style16medium.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    article.description ?? 'No description..!',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.style16medium.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

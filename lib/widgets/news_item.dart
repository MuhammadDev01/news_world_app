import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
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
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.remove_circle,
                      size: 64,
                      color: Colors.blueAccent,
                    ),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.right,
            article.title ?? 'empty..!',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          Text(
            article.description??'empty..!',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

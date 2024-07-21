import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});
final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body:Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
               NewsListBuilder(category: category)
            ],
          ),
        ),
      ),
    );
  }
}

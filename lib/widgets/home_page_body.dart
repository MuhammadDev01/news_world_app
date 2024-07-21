import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CategoriesListView()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        NewsListBuilder(
          category: 'general',
        ),
      ],
    );
  }
}

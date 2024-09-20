import 'package:flutter/material.dart';
import 'package:news_app/views/general_view.dart';
import 'package:news_app/widgets/categories_list_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      // physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CategoriesListView()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        ),
        GeneralView(),
      ],
    );
  }
}

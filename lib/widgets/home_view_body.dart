import 'package:flutter/material.dart';
import 'package:news_app/views/general_view.dart';
import 'package:news_app/widgets/categories_list_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategoriesListView()),
          BreakingNewsTitle(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          GeneralView(),
        ],
      ),
    );
  }
}

class BreakingNewsTitle extends StatelessWidget {
  const BreakingNewsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Breaking ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.red,
                letterSpacing: 1,
              ),
            ),
            TextSpan(
              text: 'News🔥',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

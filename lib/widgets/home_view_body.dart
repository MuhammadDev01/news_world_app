import 'package:flutter/material.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/views/general_view.dart';
import 'package:news_app/views/search_view.dart';
import 'package:news_app/widgets/categories_list_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategoriesListView()),
          BreakingNewsTitleAndSearchBar(),
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

class BreakingNewsTitleAndSearchBar extends StatelessWidget {
  const BreakingNewsTitleAndSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const Expanded(
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
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Search 🔎',
                style: AppStyle.style16medium.copyWith(color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

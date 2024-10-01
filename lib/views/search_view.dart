import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/utils/app_style.dart';
import 'package:news_app/utils/assets_images.dart';
import 'package:news_app/widgets/news_list_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white70,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              Assets.imagesBackground,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            SearchViewBody(),
          ],
        ),
      ),
    );
  }
}

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            style: const TextStyle(
              color: Colors.white, // يُعين لون النص الجديد هنا
            ),
            decoration: InputDecoration(
              hintText: 'Search for news...',
              suffixIcon: GestureDetector(
                  onTap: () {
                    NewsCubit.get(context).getSearchNews(controller.text);
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.white70,
                  )),
              hintStyle: const TextStyle(
                color: Colors.white70,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocBuilder<NewsCubit, NewsStates>(
              builder: (context, state) {
                if (state is SearchNewsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ScienceNewsFailureState) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: AppStyle.style16medium,
                    ),
                  );
                }
                if (state is SearchNewsSuccessState) {
                  return Expanded(
                    child: NewsListView(
                      articles: NewsCubit.get(context).searchArticles,
                    ),
                  );
                }

                return Center(
                    child: Text(
                  'No Search Found ',
                  style: AppStyle.style16medium.copyWith(
                    fontSize: 26,
                    color: Colors.white70,
                  ),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

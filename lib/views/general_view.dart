import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/widgets/news_list_view.dart';

class GeneralView extends StatelessWidget {
  const GeneralView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GeneralNewsLoadingState) {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
        if (state is GeneralNewsFailureState) {
          return SliverToBoxAdapter(
              child: Center(child: Text(state.errorMessage)));
        }
        if (state is GeneralNewsSuccessState) {
          return NewsListView(articles: NewsCubit.get(context).generalArticles);
        }

        return const SliverToBoxAdapter(
            child: Center(child: Text('Error try again')));
      },
    );
  }
}

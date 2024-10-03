import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/widgets/news_list_view.dart';

class ScienceView extends StatefulWidget {
  const ScienceView({super.key});

  @override
  State<ScienceView> createState() => _ScienceViewState();
}

class _ScienceViewState extends State<ScienceView> {
  @override
  void initState() {
    NewsCubit.get(context).getScienceNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: backgroundImageApp(),
          ),
          child: BlocBuilder<NewsCubit, NewsStates>(
            builder: (context, state) {
              if (state is ScienceNewsLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
              if (state is ScienceNewsFailureState) {
                return SnackBar(
                  content: Text(
                    state.errorMessage,
                  ),
                  backgroundColor: Colors.red,
                );
              }

              return NewsListView(
                articles: NewsCubit.get(context).scienceArticles,
              );
            },
          ),
        ),
      ),
    );
  }
}

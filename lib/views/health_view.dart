import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/widgets/news_list_view.dart';

class HealthView extends StatefulWidget {
  const HealthView({super.key});

  @override
  State<HealthView> createState() => _HealthViewState();
}

class _HealthViewState extends State<HealthView> {
  @override
  void initState() {
    NewsCubit.get(context).getHealthNews();
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
              if (state is BusinessNewsLoadingState) {
                return const Center(child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
              if (state is BusinessNewsFailureState) {
                return SnackBar(
                  content: Text(
                    state.errorMessage,
                  ),
                  backgroundColor: Colors.red,
                );
              }

              return NewsListView(
                articles: NewsCubit.get(context).healthArticles,
              );
            },
          ),
        ),
      ),
    );
  }
}

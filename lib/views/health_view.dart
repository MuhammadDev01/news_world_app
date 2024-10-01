import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/utils/assets_images.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        body: Stack(
          children: [
            Image.asset(
              Assets.imagesBackground,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            BlocConsumer<NewsCubit, NewsStates>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is BusinessNewsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is BusinessNewsFailureState) {
                  return SnackBar(
                    content: Text(
                      state.errorMessage,
                    ),
                    backgroundColor: Colors.red,
                  );
                }

                return Expanded(
                  child: NewsListView(
                    articles: NewsCubit.get(context).healthArticles,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
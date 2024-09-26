import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_list_view.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  List<ArticleModel> businessList = [];
  @override
  void initState() async {
    super.initState();
    if (businessList.isEmpty) {
      businessList =
          await NewsCubit.get(context).getHeadLinesNews(category: kBusiness);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GeneralNewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GeneralNewsFailureState) {
          return SnackBar(
            content: Text(
              state.errorMessage,
            ),
            backgroundColor: Colors.red,
          );
        }
        if (state is GeneralNewsSuccessState) {
          return NewsListView(articles: businessList);
        }

        return const SliverToBoxAdapter(
            child: Center(child: Text('Error try again')));
      },
    );
  }
}

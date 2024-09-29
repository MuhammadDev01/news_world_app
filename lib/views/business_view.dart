import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/widgets/news_list_view.dart';

class BusinessView extends StatefulWidget {
  const BusinessView({super.key});

  @override
  State<BusinessView> createState() => _BusinessViewState();
}

class _BusinessViewState extends State<BusinessView> {
  @override
  void initState() {
    NewsCubit.get(context).getBusinessNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(),
        body: BlocConsumer<NewsCubit, NewsStates>(
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
            articles: NewsCubit.get(context).businessArticles,
          ),
        );
      },
    ));
  }
}

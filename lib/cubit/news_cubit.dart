import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  List<ArticleModel> generalArticles = [];
  List<ArticleModel> articles = [];
  //List<ArticleModel> sportsArticles = [];
  //List<ArticleModel> healthArticles = [];
  //List<ArticleModel> scienceArticles = [];
  //List<ArticleModel> technologyArticles = [];
  //List<ArticleModel> searchArticles = [];

  Future<List<ArticleModel>> getHeadLinesNews({
    required String category,
  }) async {
    emit(GeneralNewsLoadingState());
    NewsService.getNews(url: 'top-headlines', query: {
      'category': category,
      'country': 'us',
    }).then((value) {
      //   emit(GeneralNewsSuccessState());
      // for (var element in value!.data['articles']) {
      //   articles.add(ArticleModel.fromJson(element));
      // }
    });

    return articles;
  }

  getGeneralNews() async {
    emit(GeneralNewsLoadingState());

    if (generalArticles.isEmpty) {
      NewsService.getNews(url: 'top-headlines', query: {
        'category': 'general',
        'country': 'us',
      }).then((value) {
        if (value.isEmpty) {
          emit(GeneralNewsFailureState(errorMessage: 'error'));
        } else {
          generalArticles = value;
          emit(GeneralNewsSuccessState());
        }
      });
    } else {
      emit(GeneralNewsSuccessState());
    }
  }
}

Future<void> getSearchNews({required String fromUser}) async {
  NewsService.getNews(url: 'everything', query: {
    'q': fromUser,
  }).then((value) {
    // for (var element in value!.data['articles']) {
    //   searchArticles.add(ArticleModel.fromJson(element));
    // }
  });
}

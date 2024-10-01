import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  List<ArticleModel> generalArticles = [];
  List<ArticleModel> businessArticles = [];
  List<ArticleModel> sportsArticles = [];
  List<ArticleModel> healthArticles = [];
  List<ArticleModel> scienceArticles = [];
  List<ArticleModel> technologyArticles = [];
  List<ArticleModel> searchArticles = [];

  Future<void> getNewsByCategory({
    required String category,
    required Function emitLoadingState,
    required Function emitFailureState,
    required Function emitSuccessState,
    required List<ArticleModel> articlesList,
  }) async {
    emitLoadingState();

    if (articlesList.isEmpty) {
      NewsService.getNews(
        url: 'top-headlines',
        query: {
          'category': category,
          'country': 'us',
        },
      ).then((value) {
        if (value.isEmpty) {
          emitFailureState(errorMessage: 'Error fetching $category news');
        } else {
          articlesList.addAll(value);
          emitSuccessState();
        }
      }).catchError((error) {
        emitFailureState(errorMessage: 'Error: $error');
      });
    } else {
      emitSuccessState();
    }
  }

  getBusinessNews() async {
    await getNewsByCategory(
      category: 'business',
      emitLoadingState: () => emit(BusinessNewsLoadingState()),
      emitFailureState: (errorMessage) =>
          emit(BusinessNewsFailureState(errorMessage: errorMessage)),
      emitSuccessState: () => emit(BusinessNewsSuccessState()),
      articlesList: businessArticles,
    );
  }

  getHealthNews() async {
    await getNewsByCategory(
      category: 'health',
      emitLoadingState: () => emit(HealthNewsLoadingState()),
      emitFailureState: (errorMessage) =>
          emit(HealthNewsFailureState(errorMessage: errorMessage)),
      emitSuccessState: () => emit(HealthNewsSuccessState()),
      articlesList: healthArticles,
    );
  }

  getSportsNews() async {
    await getNewsByCategory(
      category: 'sports',
      emitLoadingState: () => emit(SportsNewsLoadingState()),
      emitFailureState: (errorMessage) =>
          emit(SportsNewsFailureState(errorMessage: errorMessage)),
      emitSuccessState: () => emit(SportsNewsSuccessState()),
      articlesList: sportsArticles,
    );
  }

  getScienceNews() async {
    await getNewsByCategory(
      category: 'science',
      emitLoadingState: () => emit(ScienceNewsLoadingState()),
      emitFailureState: (errorMessage) =>
          emit(ScienceNewsFailureState(errorMessage: errorMessage)),
      emitSuccessState: () => emit(ScienceNewsSuccessState()),
      articlesList: scienceArticles,
    );
  }

  getTechnologyNews() async {
    await getNewsByCategory(
      category: 'technology',
      emitLoadingState: () => emit(TechnologyNewsLoadingState()),
      emitFailureState: (errorMessage) =>
          emit(TechnologyNewsFailureState(errorMessage: errorMessage)),
      emitSuccessState: () => emit(TechnologyNewsSuccessState()),
      articlesList: technologyArticles,
    );
  }

  getSearchNews(String query) async {
    searchArticles = [];
    emit(SearchNewsLoadingState());

    NewsService.getNews(
      url: 'everything',
      query: {
        'q': query,
      },
    ).then((value) {
      if (value.isEmpty) {
        emit(SearchNewsFailureState(
            errorMessage: 'No results found for $query'));
      } else {
        searchArticles = value;
        emit(SearchNewsSuccessState());
      }
    }).catchError((error) {
      emit(SearchNewsFailureState(errorMessage: 'Error: $error'));
    });
  }

  void getGeneralNews() async {
    await getNewsByCategory(
      category: 'general',
      emitLoadingState: () => emit(GeneralNewsLoadingState()),
      emitFailureState: (errorMessage) =>
          emit(GeneralNewsFailureState(errorMessage: errorMessage)),
      emitSuccessState: () => emit(GeneralNewsSuccessState()),
      articlesList: generalArticles,
    );
  }
}

part of 'news_cubit.dart';

sealed class NewsStates {}

final class NewsInitialState extends NewsStates {}

final class NewsLoadingState extends NewsStates {}

final class NewsSuccessState extends NewsStates {}

final class NewsFailureState extends NewsStates {
  final String errorMessage;
  NewsFailureState({required this.errorMessage});
}

final class SearchNewsSuccessState extends NewsStates {}

final class SearchNewsFailureState extends NewsStates {
  final String errorMessage;

  SearchNewsFailureState({required this.errorMessage});
}

final class SearchNewsLoadingState extends NewsStates {}

final class BusinessNewsSuccessState extends NewsStates {}

final class BusinessNewsFailureState extends NewsStates {
  final String errorMessage;

  BusinessNewsFailureState({required this.errorMessage});
}

final class BusinessNewsLoadingState extends NewsStates {}

final class SportsNewsSuccessState extends NewsStates {}

final class SportsNewsFailureState extends NewsStates {
  final String errorMessage;

  SportsNewsFailureState({required this.errorMessage});
}

final class SportsNewsLoadingState extends NewsStates {}

final class ScienceNewsSuccessState extends NewsStates {}

final class ScienceNewsFailureState extends NewsStates {
    final String errorMessage;

  ScienceNewsFailureState({required this.errorMessage});

}

final class ScienceNewsLoadingState extends NewsStates {}

final class GeneralNewsSuccessState extends NewsStates {}

final class GeneralNewsFailureState extends NewsStates {
  final String errorMessage;
  GeneralNewsFailureState({required this.errorMessage});
}

final class GeneralNewsLoadingState extends NewsStates {}

final class HealthNewsSuccessState extends NewsStates {}

final class HealthNewsFailureState extends NewsStates {
  final String errorMessage;

  HealthNewsFailureState({required this.errorMessage});
}

final class HealthNewsLoadingState extends NewsStates {}

final class TechnologyNewsSuccessState extends NewsStates {}

final class TechnologyNewsFailureState extends NewsStates {
    final String errorMessage;

  TechnologyNewsFailureState({required this.errorMessage});

}

final class TechnologyNewsLoadingState extends NewsStates {
}

part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  var records;

  NewsLoadedState({
    required this.records
  });
}

class NewsErrorState extends NewsState {}

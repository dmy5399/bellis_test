import 'dart:async';
import 'package:bellis_test/data/models/news_model.dart';
import 'package:bellis_test/data/repositories/news_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository repo = NewsRepository();

  NewsBloc(this.repo) : super(NewsInitialState()) {
    on<NewsLoadEvent>((event, emit) async {
      emit(NewsLoadingState());

      try{
        List<NewsModel> records = await repo.getAll();
        emit(NewsLoadedState(records: records));
      } catch (e) {
        emit(NewsErrorState());
      }

    });
  }
}

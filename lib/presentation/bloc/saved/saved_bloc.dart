import 'dart:async';
import 'package:bellis_test/data/models/news_model.dart';
import 'package:bellis_test/data/repositories/news_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  NewsRepository repo = NewsRepository();

  SavedBloc(this.repo) : super(SavedInitialState()) {
    on<SavedSaveEvent>((event, emit) {
      try{
        repo.saveLocal(event.record);
      } catch (_) {
        emit(SavedErrorState());
      }
    });

    on<SavedRemoveEvent>((event, emit) {
      try{
        repo.removeLocal(event.record);
      } catch (_) {
        emit(SavedErrorState());
      }
    });

    on<SavedLoadEvent>((event, emit) async {
      emit(SavedLoadingState());

      try{
        List<NewsModel> records = await repo.getAllLocal();
        emit(SavedLoadedState(records: records));
      } catch (e) {
        emit(SavedErrorState());
      }

    });

  }

}

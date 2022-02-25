import 'dart:async';

import 'package:bellis_test/data/models/news_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedInitialState()) {
    on<SavedSaveEvent>((event, emit) {
      emit(SavedLoadingState());

      try{
        
      } catch (_) {

      }
    });
  }
}

part of 'saved_bloc.dart';

@immutable
abstract class SavedEvent {}

class SavedSaveEvent extends SavedEvent {
  NewsModel record;

  SavedSaveEvent(this.record);
}

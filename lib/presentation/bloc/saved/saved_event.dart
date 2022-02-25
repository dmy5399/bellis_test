part of 'saved_bloc.dart';

@immutable
abstract class SavedEvent {}

class SavedLoadEvent extends SavedEvent {}

class SavedSaveEvent extends SavedEvent {
  NewsModel record;

  SavedSaveEvent(this.record);
}

class SavedRemoveEvent extends SavedEvent {
  NewsModel record;

  SavedRemoveEvent(this.record);
}

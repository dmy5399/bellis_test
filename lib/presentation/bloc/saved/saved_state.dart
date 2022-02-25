part of 'saved_bloc.dart';

@immutable
abstract class SavedState {}

class SavedInitialState extends SavedState {}

class SavedLoadingState extends SavedState {}

class SavedLoadedState extends SavedState {}

class SavedErrorState extends SavedState {}

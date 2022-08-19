part of 'cat_bloc.dart';

@immutable
abstract class CatFactsEvent {}

/// [LoadNewCatFact] event called when need to get new fact about cats.
class LoadNewCatFact extends CatFactsEvent {}

/// [LoadedNewCatFact] event called when new fact about cats was loaded.
class LoadedNewCatFact extends CatFactsEvent {}

/// [ErrorLoaded] event called when new fact loading throws error.
class ErrorLoaded extends CatFactsEvent {}

/// [OnInitLoaded] event called when onInit function was called.
class OnInitLoaded extends CatFactsEvent {}

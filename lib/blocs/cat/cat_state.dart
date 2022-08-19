part of 'cat_bloc.dart';

@immutable
abstract class CatFactsState {}

/// Initial state.
class CatFactInitial extends CatFactsState {}

/// Fact loading state.
class CatFactLoading extends CatFactsState {}

/// Fact loaded state.
class CatFactLoaded extends CatFactsState {}

/// Error while loading fact state.
class ErrorFactLoad extends CatFactsState {}

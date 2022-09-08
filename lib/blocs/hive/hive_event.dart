part of 'hive_bloc.dart';

@immutable
abstract class HiveEvent {}

/// [OnInitLoaded] event called when onInit function was called.
class OnInitLoaded extends HiveEvent {}

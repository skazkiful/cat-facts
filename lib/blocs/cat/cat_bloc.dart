import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '/blocs/api/api_bloc.dart';
import '/blocs/hive/hive_bloc.dart';
import '/models/fact/fact_model.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatFactsBloc extends Bloc<CatFactsEvent, CatFactsState> {
  CatFactsBloc() : super(CatFactInitial()) {
    on<LoadNewCatFact>((event, emit) async {
      imageCache.clear();
      emit(CatFactLoading());
      await loadRandomFact();
    });
    on<LoadedNewCatFact>((event, emit) {
      emit(CatFactLoaded());
    });
    on<ErrorLoaded>((event, emit) {
      emit(ErrorFactLoad());
    });
  }

  /// Currently loaded [Fact] about cats.
  late Fact _fact;

  /// Getter of [_fact].
  Fact get fact => _fact;

  /// Load random fact about cats.
  Future<void> loadRandomFact() async {
    try {
      _fact = await ApiBloc().loadFact();
      HiveBloc().addFactToHive(fact);
      add(LoadedNewCatFact());
    } catch (e) {
      add(ErrorLoaded());
    }
  }
}

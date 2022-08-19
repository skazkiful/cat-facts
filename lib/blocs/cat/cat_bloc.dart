import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '/hive/fact/fact.dart';
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
    on<OnInitLoaded>((event, emit) {
      emit(CatFactInitial());
    });
  }

  /// [Hive] box.
  Box? _box;

  /// Currently loaded [Fact] about cats.
  late Fact _fact;

  /// Getter of [_fact].
  Fact get fact => _fact;

  /// Getter of [_box.values].
  Iterable<dynamic>? get box => _box?.values;

  /// Function calls when [CatFactsBloc] was created.
  Future<void> onInit() async {
    _box ??= await Hive.openBox('myBox', path: Directory.current.path);
    add(OnInitLoaded());
  }

  /// Load random fact about cats.
  Future<void> loadRandomFact() async {
    try {
      _fact = await RestFactClient(Dio()).getRandomFact();
      FactHive person = FactHive(text: fact.text, date: fact.createdAt);
      _box!.add(person);
      add(LoadedNewCatFact());
    } catch (e) {
      add(ErrorLoaded());
    }
  }
}

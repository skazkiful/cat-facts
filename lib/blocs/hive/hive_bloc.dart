import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '/hive/fact/fact.dart';
import '/models/fact/fact_model.dart';

part 'hive_event.dart';
part 'hive_state.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  HiveBloc() : super(HiveInitial()) {
    on<OnInitLoaded>((event, emit) {
      emit(HiveInitial());
    });
  }

  /// [Hive] box.
  Box? _box;

  /// Getter of [_box.values].
  Box? get box => _box;

  /// Function calls when [CatFactsBloc] was created.
  Future<void> onInit() async {
    _box ??= await Hive.openBox('facts', path: Directory.current.path);
    add(OnInitLoaded());
  }

  /// Add [Fact] to hive.
  void addFactToHive(Fact fact) =>
      _box!.add(FactHive(text: fact.text, date: fact.createdAt));
}

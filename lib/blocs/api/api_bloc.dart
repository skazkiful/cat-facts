import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '/models/fact/fact_model.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial());

  /// Returns random [Fact].
  Future<Fact> loadFact() async {
    return await RestFactClient(Dio()).getRandomFact();
  }
}

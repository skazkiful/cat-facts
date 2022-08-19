import 'dart:io';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/hive/fact/fact.dart';
import 'app.dart';
import 'observer.dart';

void main() async {
  String path = Directory.current.path;
  Hive
    ..initFlutter(path)
    ..registerAdapter(FactHiveAdapter());
  Bloc.observer = BlocsObserver();
  runApp(const CatsFactsApp());
}

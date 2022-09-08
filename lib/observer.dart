import 'package:bloc/bloc.dart';

import '/blocs/hive/hive_bloc.dart';

class BlocsObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) async {
    if (bloc is HiveBloc) {
      await bloc.onInit();
    }
    super.onCreate(bloc);
  }
}

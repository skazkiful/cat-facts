import 'package:bloc/bloc.dart';

import '/blocs/cat/cat_bloc.dart';

class BlocsObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) async {
    if (bloc is CatFactsBloc) {
      await bloc.onInit();
    }
    super.onCreate(bloc);
  }
}

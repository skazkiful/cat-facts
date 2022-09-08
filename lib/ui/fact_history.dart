import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/cat/cat_bloc.dart';
import '/blocs/hive/hive_bloc.dart';
import '/hive/fact/fact.dart';

class FactHistoryPage extends StatelessWidget {
  const FactHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facts history'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CatFactsBloc>(
            create: (BuildContext context) => CatFactsBloc(),
          ),
          BlocProvider<HiveBloc>(
            create: (BuildContext context) => HiveBloc(),
          ),
        ],
        child: Center(
          child: BlocBuilder<CatFactsBloc, CatFactsState>(
            builder: (context, state) =>
                (context.read<HiveBloc>().box != null &&
                        context.read<HiveBloc>().box!.isOpen)
                    ? ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          FactHive fact = context
                              .read<HiveBloc>()
                              .box!
                              .values
                              .toList()
                              .reversed
                              .toList()[index];
                          return ListTile(
                            title: Text(
                              fact.text,
                            ),
                            subtitle: Text(fact.date.toString()),
                          );
                        },
                        itemCount: context.read<HiveBloc>().box!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      )
                    : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/cat/cat_bloc.dart';
import 'fact_history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat facts'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => CatFactsBloc(),
        child: Center(
          child: BlocBuilder<CatFactsBloc, CatFactsState>(
              builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  if (state is CatFactInitial)
                    const Text('Here would be fact about cats'),
                  if (state is CatFactLoaded) ...[
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        'https://cataas.com/cat',
                        fit: BoxFit.cover,
                        frameBuilder: (c, child, frame, loaded) {
                          if (frame == 0 || loaded) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                        errorBuilder: (_, __, ___) =>
                            const Center(child: Text('😢')),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(context.read<CatFactsBloc>().fact.text),
                  ],
                  if (state is ErrorFactLoad) const Text('error loading'),
                  if (state is CatFactLoading)
                    const CircularProgressIndicator(),
                  const SizedBox(height: 15),
                  TextButton(
                    child: const Text('Another fact!'),
                    onPressed: () =>
                        context.read<CatFactsBloc>().add(LoadNewCatFact()),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    child: const Text('Fact history'),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FactHistoryPage()),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

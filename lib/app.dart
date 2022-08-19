import 'package:flutter/material.dart';

import 'ui/home_page.dart';

class CatsFactsApp extends MaterialApp {
  const CatsFactsApp({super.key})
      : super(
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
}

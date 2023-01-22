import 'package:flutter/material.dart';
import 'package:shopping_list_app/Pages/shopping_list/shopping_list_page.dart';

import 'navigation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Shopping List App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: NavigationWidget(),
    );
  }
}

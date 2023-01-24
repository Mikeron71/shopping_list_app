import 'package:flutter/material.dart';
import 'package:shopping_list_app/Pages/shopping_list/shopping_list_page.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list_app/providers/item_list_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: ((_) => ItemList()))],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Shopping List App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: ShoppingListPage(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("coucou"));
  }
}

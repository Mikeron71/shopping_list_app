import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // modifier la fonction button
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print("button pressed");
          },
          label: const Text("Add an item"),
        ),
        body: Column(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Shopping List',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print("button pressed");
          },
          label: const Text("Add an item"),
        ),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Shopping List',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ShoppingItem("Patate"),
            ShoppingItem("Pizza"),
            ShoppingItem("Pain"),
          ],
        ));
  }
}

class ShoppingItem extends StatefulWidget {
  late String itemName;

  ShoppingItem(this.itemName, {super.key});

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  bool _coche = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        value: _coche,
        title: Text(widget.itemName),
        onChanged: (bool? value) {
          setState(() {
            _coche = !_coche;
          });
        });
  }
}

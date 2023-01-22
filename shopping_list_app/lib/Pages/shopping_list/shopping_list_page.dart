import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopping_list_app/Pages/shopping_list/top_banner.dart';

class ShoppingListPage extends StatefulWidget {
  ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<ShoppingItem> foodItems = [
    ShoppingItem("Patate", false),
    ShoppingItem("Pizza", false),
    ShoppingItem("Pain", false)
  ];

  final textc = TextEditingController();

  addToList() {
    if (textc.text != "") {
      setState(() {
        foodItems.add(ShoppingItem(textc.text, false));
        textc.clear();
        FocusScope.of(context).unfocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset("assets/images/food.png",
            fit: BoxFit.fill, height: double.infinity, width: double.infinity),
        Column(
          children: <Widget>[
            const TopBanner(),
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final item = foodItems[index];
                  return Dismissible(
                    // Each Dismissible must contain a Key. Keys allow Flutter to
                    // uniquely identify widgets.
                    key: Key(item.itemName),
                    // Provide a function that tells the app
                    // what to do after an item has been swiped away.
                    onDismissed: (direction) {
                      // Remove the item from the data source.
                      setState(() {
                        foodItems.removeAt(index);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${item.itemName} deleted")));
                    },
                    child: item,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: textc,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Add an item',
                    suffixIcon: IconButton(
                        onPressed: () {
                          addToList();
                        },
                        icon: const Icon(Icons.add))),
              ),
            ),
          ],
        )
      ],
    ));
  }
}

class ShoppingItem extends StatefulWidget {
  final String itemName;
  bool? _coche;

  ShoppingItem(this.itemName, this._coche, {super.key});

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: CheckboxListTile(
          value: widget._coche,
          title: Text(widget.itemName),
          onChanged: (bool? newValue) {
            setState(() {
              widget._coche = newValue;
            });
          }),
    );
  }
}

import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<ShoppingItem> foodItems = [
    ShoppingItem("Patate"),
    ShoppingItem("Pizza"),
    ShoppingItem("Pain")
  ];

  final textc = TextEditingController();

  addToList() {
    setState(() {
      foodItems.add(ShoppingItem(textc.text));
      textc.clear();
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     foodItems.add(ShoppingItem("test"));
        //   },
        //   label: const Text("Add an item"),
        // ),
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
        Expanded(
          child: ListView(
            children: [for (ShoppingItem x in foodItems) x],
          ),
        ),
        TextField(
          controller: textc,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Add an item',
              suffixIcon: IconButton(
                  onPressed: () {
                    addToList();
                  },
                  icon: const Icon(Icons.add))),
        ),
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

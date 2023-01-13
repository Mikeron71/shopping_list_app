import 'package:flutter/material.dart';
import 'package:shopping_list_app/Pages/shopping_list/top_banner.dart';

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
    if (textc.text != "") {
      setState(() {
        foodItems.add(ShoppingItem(textc.text));
        textc.clear();
        FocusScope.of(context).unfocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        TopBanner(),
        Expanded(
          child: ListView.builder(
            itemCount: foodItems.length,
            itemBuilder: (context, index) {
              return Dismissible(
                  key: UniqueKey(),
                  child: foodItems[index],
                  onDismissed: (direction) => setState(() {
                        foodItems.removeAt(index);
                      }));
            },
          ),
        ),
        TextField(
          controller: textc,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
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
  final String itemName;

  const ShoppingItem(this.itemName, {super.key});

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  bool _coche = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 187, 246, 189),
      child: CheckboxListTile(
          value: _coche,
          title: Text(widget.itemName),
          onChanged: (bool? value) {
            setState(() {
              _coche = !_coche;
            });
          }),
    );
  }
}

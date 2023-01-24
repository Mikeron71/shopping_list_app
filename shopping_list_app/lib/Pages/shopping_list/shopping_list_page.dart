import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list_app/Pages/shopping_list/top_banner.dart';
import 'package:shopping_list_app/providers/item_list_provider.dart';

class ShoppingListPage extends StatefulWidget {
  ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final textc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Shop-It')),
          backgroundColor: Colors.redAccent,
        ),
        body: Stack(
          children: [
            Image.asset("assets/images/food.png",
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  const TopBanner(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: context.watch<ItemList>().foodItems.length,
                      itemBuilder: (context, index) {
                        final item = context.watch<ItemList>().foodItems[index];
                        return Dismissible(
                          key: Key(item.itemName),
                          onDismissed: (direction) {
                            setState(() {
                              context.read<ItemList>().removeItem(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("${item.itemName} deleted")));
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
                                context.read<ItemList>().addItem(textc.text);
                                textc.clear();
                              },
                              icon: const Icon(Icons.add))),
                    ),
                  ),
                ],
              ),
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
          activeColor: Colors.redAccent,
          onChanged: (bool? newValue) {
            setState(() {
              widget._coche = newValue;
            });
          }),
    );
  }
}

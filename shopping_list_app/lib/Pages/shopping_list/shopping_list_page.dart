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
        TopBanner(foodItems),
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
  late String itemName;

  ShoppingItem(this.itemName, {super.key});

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  bool _coche = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 187, 246, 189),
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

enum SampleItem { itemOne, itemTwo, itemThree }

class TopBanner extends StatefulWidget {
  TopBanner(List<ShoppingItem> sl, {super.key});

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 32.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            // Callback that sets the selected popup menu item.
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Text('Delete all'),
                onTap: () => {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

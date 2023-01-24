import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:shopping_list_app/providers/item_list_provider.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class TopBanner extends StatefulWidget {
  const TopBanner({super.key});

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
            icon: (const Icon(
              Icons.more_vert_rounded,
              color: Colors.redAccent,
            )),
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
                child: const Text('Delete all'),
                onTap: () => {context.read<ItemList>().clearItems()},
              ),
            ],
          ),
        )
      ],
    );
  }
}

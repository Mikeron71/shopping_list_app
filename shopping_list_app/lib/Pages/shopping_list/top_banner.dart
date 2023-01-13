import 'package:flutter/material.dart';

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
                onTap: () => {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

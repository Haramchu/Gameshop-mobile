import 'package:flutter/material.dart';
import 'package:gameshop/item_model.dart';
import 'package:gameshop/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> items = Provider.of<ItemModel>(context).items;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Game Shop',
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Price: ${items[index].price}'),
                Text('Description: ${items[index].description}'),
              ],
            ),
            onTap: () {
              // You can add any additional functionality here when an item is tapped
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gameshop/widgets/left_drawer.dart';

class ItemPage extends StatelessWidget {
  final List<Item>
      items; // Assuming Item is a class to represent each entered item

  const ItemPage({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'List Item',
          ),
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
            subtitle: Text('Price: ${items[index].price}'),
            onTap: () {
              // You can add any additional functionality here when an item is tapped
              // For example, navigate to a detailed view of the item
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ItemDetailPage(item: items[index]),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}

class Item {
  final String name;
  final int price;
  final String description;

  Item({required this.name, required this.price, required this.description});
}

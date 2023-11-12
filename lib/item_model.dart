// item_model.dart
import 'package:flutter/foundation.dart';

class ItemModel extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }
}

class Item {
  final String name;
  final int price;
  final String description;

  Item({required this.name, required this.price, required this.description});
}

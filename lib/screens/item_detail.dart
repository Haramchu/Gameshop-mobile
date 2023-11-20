import 'package:flutter/material.dart';
import 'package:gameshop/models/item.dart'; // Import model Item untuk digunakan di halaman detail

class ItemDetail extends StatelessWidget {
  final Item item; // Terima objek Item dari halaman sebelumnya

  const ItemDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name), // Gunakan nama item sebagai judul AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amount: ${item.fields.amount}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8),
            Text(
              'Price: ${item.fields.price}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${item.fields.description}',
              style: TextStyle(fontSize: 18.0),
            ),
            // Tambahkan informasi lainnya sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}

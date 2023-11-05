Nama        : Clement Samuel Marly

NPM         : 2206082114

Kelas       : PBP C

[Tugas 7](#tugas-7)

# Tugas 7
## Membuat sebuah program Flutter baru
1. Instalasi flutter di [windows](https://docs.flutter.dev/get-started/install/windows).
2. Instalasi IDE yang ingin digunakan untuk pengembangan flutter.
a. [Android Studio](https://developer.android.com/studio)
b. [Visual Studio Code](https://code.visualstudio.com/) dengan tambahan ekstensi [Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) dan [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
3. Buka Terminal di direktori tempat penyimpanan proyek yang diinginkan.
4. Jalankan perintah 
```
flutter create gameshop
cd gameshop
```
5. Jalankan proyek dan pilih browser yang diinginkan untuk menjalankan proyek.
```
flutter run
```
6. Pastikan proyek bisa berjalan dan apabila sudah, inisiasi repositori baru di dalam github dan `add`-`comit`-`push` proyek flutter.

## Membuat tiga tombol sederhana dan memunculkan `Snackbar` dengan tulisan
1. Buat file baru bernama `menu.dart` pada direktori `gameshop/lib` dan tambahkan kode berikut
```
import 'package:flutter/material.dart';
```
2. Dari file `main.dart`, pindahkan(*cut*) kode baris ke-39 hingga akhir yang berisi kedua class di bawah ini:
```
class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}
```
3. Di file `menu.dart` tambahkan kode berikut untuk menghindari *unidentified error MyHomePage*:
```dart
import 'package:gameshop/menu.dart';
```
4. Buka kembali file `main.dart` dan ubah sifat *widget* halaman menu menjadi *stateless* dengan cara mengubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi:
```dart
MyHomePage()
```
5. Buka file `menu.dart` dan ubah sifat *widget* halaman menjadi *stateless* dengan mengubah `({super.key, required this.title})` menjadi:
```dart
({Key? key}) : super(key: key);
```
6. Setelah diubah, hapus bagian `final String title;` dan bagian bawahnya serta tambahkan *Widget build* sehingga kode terlihat seperti berikut:
```dart
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
7. *Define* tipe untuk menambahkan teks dan *card* dengan kode berikut:
```dart
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```
8. Tambahkan *description* untuk mengatur warna, teks, dan *icon* dibawah kode `MyHomePage({Key? key}) : super(key: key);`.
```dart
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.blue),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.green),
    ShopItem("Logout", Icons.logout, Colors.red),
  ];
```
9. Tambahkan kode berikut di dalam *Widget build*.
```dart
return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Shop', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```
10. Buat *widget stateless* baru untuk menampilkan *card*.
```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
11. Pastikan proyek dapat berjalan dan tombol yang keluar sesuai dengan kode.

## Perbedaan utama antara *stateless* dan *stateful widget*
### *Stateless Widget*:
- Tidak dapat diubah (*Immutable*): Setelah *build*, tidak dapat mengubah keadaan atau informasi yang ditampilkannya.
- Method: *Stateless widget* meng-*override* build() method untuk merender UI, yang dipicu hanya sekali saat widget pertama kali dibuat.
- Contoh penggunaan: bagian pengguna yang tidak bergantung pada perubahan variabel atau interaksi pengguna, seperti Text, RaisedButton, dan Icon.

### *Stateful Widget*:
- Dapat diubah (*Mutable*): dapat diubah sesuai dengan interaksi pengguna atau ada perubahan variabel.
- Method: *Stateful widget* meng-*override* createState() method untuk membuat objek State yang dapat diperbarui, memungkinkan perubahan dalam *widget*.
- Contoh penggunaan: bagian pengguna yang perlu diperbarui secara dinamis, seperti CheckBox, RadioButton, Form, TextField, dan sejenisnya.

Ketika menggunakan Flutter, kedua jenis *widget* ini penting karena memengaruhi perancangan *user interface* dan menangani perubahan dalam aplikasi.

Source:[geeksforgeeks](https://www.geeksforgeeks.org/flutter-stateful-vs-stateless-widgets/)

## *Widget* yang digunakan
### main.dart
*MyApp*: widget utama yang bersifat StatelessWidget dan berfungsi menetapkan tema aplikasi dan menentukan MyHomePage sebagai *home* aplikasi.
*MaterialApp*: widget untuk membuat aplikasi Flutter. Berfungsi untuk enyediakan beberapa parameter, seperti *title*, *theme*, dan *home*.

### menu.dart
*MyHomePage*: widget utama yang berperan sebagai halaman utama dari aplikasi. Ini adalah widget StatelessWidget yang memiliki daftar ShopItem dan menggunakan GridView.count untuk menampilkan daftar *Shopcard*.
*ShopCard*: widget StatelessWidget yang mewakili *Shopitem card*. Ini menampilkan ikon, teks, dan warna yang terkait dengan item yang diberikan.

Widget lain yang digunakan, seperti *Scaffold, AppBar, SingleChildScrollView, Padding, Column, GridView.count, InkWell, Container, Center, Icon, Text, dan SnackBar*, adalah bagian dari Flutter SDK dan digunakan untuk mengatur tata letak dan menampilkan elemen UI yang berbeda di aplikasi.

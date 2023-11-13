Nama        : Clement Samuel Marly

NPM         : 2206082114

Kelas       : PBP C

[Tugas 7](#tugas-7)

[Tugas 8](#tugas-8)

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

# Tugas 7
## Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`
### `Navigator.push()`
`Navigator.push()` menambahkan *suatu route* ke dalam *stack route* yang dikelola oleh `Navigator`. Method ini menyebabkan *route* yang ditambahkan berada pada paling atas *stack*, sehingga *route* yang baru saja ditambahkan tersebut akan muncul dan ditampilkan kepada pengguna.
Contoh penggunaan:
```dart
if (item.name == "Tambah Item") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ShopFormPage(),
    ),
  );
}
```
`Navigator.push()` digunakan di dalam `MyHomePage()` di `menu.dart` tersebut untuk pindah ke dalam halaman `ShopFormPage()` dan saat pengguna sudah selesai, mereka akan secara automatis kembali ke halaman `MyHomePage()` di `menu.dart`
### `Navigator.pushReplacement()`
`Navigator.pushReplacement()` menghapus *route* yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu *route*. Method ini menyebabkan aplikasi untuk berpindah dari *route* yang sedang ditampilkan kepada pengguna ke suatu *route* yang diberikan. Pada *stack route* yang dikelola `Navigator`, *route* lama pada atas *stack* akan digantikan secara langsung oleh *route* baru yang diberikan tanpa mengubah kondisi elemen *stack* yang berada di bawahnya.
Contoh penggunaan:
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  ),
);
```
`Navigator.pushReplacement()` digunakan untuk *replace stack route* yang ada di paling atas dengan halaman `MyHomePage()`. Hal ini dilakukan agar pengguna tidak kembali ke halaman lain atau sebelumnya setelah selesai dari halaman `MyHomePage()`.

Perbedaan utama kedua method tersebut terletak pada apa yang dilakukan kepada *route* yang berada pada atas *stack*. `Navigator.push()` akan menambahkan *route* baru diatas *route* yang sudah ada pada atas *stack*, sedangkan `Navigator.pushReplacement()` menggantikan *route* yang sudah ada pada atas *stack* dengan *route* baru tersebut. 

## *Layout* widget pada Flutter dan penggunaannya
### *Container*
*Container* adalah widget yang digunakan untuk mengatur tata letak dan mengatur *style* elemen lainnya. Ini dapat digunakan untuk menentukan batas, padding, warna latar, dan sebagainya.
Contoh penggunaan:
```dart
Container(
  margin: EdgeInsets.all(16.0),
  padding: EdgeInsets.all(8.0),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8.0),
  ),
  child: Text('Hello, Flutter!'),
)
```
### *Row* dan *Column*
Digunakan untuk mengatur elemen-elemen secara horizontal (*Row*) atau vertikal (*Column*). Berguna ketika ingin menyusun atau mengatur letak widget.
Contoh penggunaan:
```dart
Row(
  children: [
    Icon(Icons.star),
    Text('5.0'),
  ],
)
Column(
  children: [
    Text('Title'),
    Text('Subtitle'),
  ],
)
```
### *Listview*
*Listview* digunakan untuk membuat daftar *scrollable list* dari widget yang dapat di-*scroll*. Berguna ketika ingin menampilkan data dalam jumlah besar.
Contoh penggunaan:
```dart
ListView(
  children: [
    ListTile(
      title: Text('Item 1'),
    ),
    ListTile(
      title: Text('Item 2'),
    ),
  ],
)
```
### *Expanded* dan *Flexible*
Kedua widget tersebut digunakan untuk memberikan widget keleluasaan dalam mengisi ruang tersedia. Digunakan dalam *Row, Column,* atau *Flex*.
Contoh penggunaan:
```dart
Column(
  children: [
    Text('Fixed Height'),
    Expanded(
      child: Container(
        color: Colors.blue,
      ),
    ),
    Text('Fixed Height'),
  ],
)
```
### *Stack*
*Stack* digunakan untuk menumpuk widget di atas satu sama lain. Berfungsi saat ingin menempatkan beberapa widget di lokasi yang sama.
Contoh penggunaan:
```dart
Stack(
  children: [
    Positioned(
      top: 10.0,
      left: 10.0,
      child: Text('Top Left'),
    ),
    Positioned(
      bottom: 10.0,
      right: 10.0,
      child: Text('Bottom Right'),
    ),
  ],
)
```
### *Gridview*
*Gridview* digunakan untuk menampilkan widget dalam susunan kolom dan baris. Berguna untuk menampilkan data dalam bentuk *grid*.
Contoh penggunaan:
```dart
GridView.count(
  primary: true,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 3,
  shrinkWrap: true,
),
```
### *SizedBox*
*SizedBox* digunakan untuk memberikan dimensi tetap pada suatu widget atau untuk membuat ruang kosong.
```dart
SizedBox(
  width: 100.0,
  height: 50.0,
  child: RaisedButton(
    onPressed: () {},
    child: Text('Button'),
  ),
)
```
Untuk *layout-layout* lainnya, dapat dilihat dalam link berikut [Flutter Layout Widgets](https://docs.flutter.dev/ui/widgets/layout?gclid=EAIaIQobChMIlOX0sea-ggMViatmAh1iIwnyEAAYASAAEgLTIfD_BwE&gclsrc=aw.ds)

## Element input dalam form
Dalam file `gameshop_form.dart`, terdapat beberapa elemen input pada *form* yang digunakan untuk memasukkan informasi *item*. Berikut adalah elemen-elemen input pada *form*:
```dart
TextFormField(
  decoration: InputDecoration(
    hintText: "Nama Item",
    labelText: "Nama Item",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _name = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Nama tidak boleh kosong!";
    }
    return null;
  },
)
TextFormField(
  decoration: InputDecoration(
    hintText: "Harga",
    labelText: "Harga",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _price = int.parse(value!);
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Harga tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
      return "Harga harus berupa angka!";
    }
    return null;
  },
)
TextFormField(
  decoration: InputDecoration(
    hintText: "Deskripsi",
    labelText: "Deskripsi",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _description = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Deskripsi tidak boleh kosong!";
    }
    return null;
  },
)

```
`TextFormField` memberikan area *input* teks yang dapat diisi dengan dukungan validasi (*validator*) untuk memastikan bahwa *input* tidak boleh kosong.

Ada juga `ElevatedButton` yang digunakan untuk menyimpan item setelah selesai divalidasi.
```dart
ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.indigo),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      Item newItem = Item(
        name: _name,
        price: _price,
        description: _description,
      );

      // Use Provider to access the ItemModel and add the new item
      Provider.of<ItemModel>(context, listen: false)
          .addItem(newItem);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Item berhasil tersimpan'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: $_name'),
                  Text('Price: $_price'),
                  Text('Description: $_description')
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
    _formKey.currentState!.reset();
  },
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.white),
  ),
),
```
## *Clean architecture*
*Clean Architecture* adalah suatu arsitektur perangkat lunak yang menekankan pemisahan konsep dan tanggung jawab di dalam aplikasi. *Clean Architecture* membagi kode ke dalam beberapa lapisan (*layers*) untuk memastikan bahwa kode bersih, terorganisir, dan dapat diuji dengan baik.
**Penerapan *Clean architecture* pada aplikasi Flutter:**
*Clean Architecture* adalah pendekatan desain perangkat lunak yang menekankan pemisahan konsep dan tanggung jawab dalam sebuah aplikasi. Pada *Clean Architecture*, ada prinsip yang dikenal sebagai "*Dependency Rule*" yang menyatakan bahwa ketergantungan arah harus mengarah ke dalam. Ini berarti modul internal tidak tahu atau tidak bergantung pada modul eksternal, sementara modul eksternal tahu dan bergantung pada modul internal.

Dalam implementasi *Clean Architecture* pada Flutter, struktur proyek biasanya dibagi menjadi beberapa lapisan:

1. *Feature Layer:*
Ini adalah lapisan presentasi aplikasi yang paling tergantung pada *framework* (Flutter). Di sini terdapat widget untuk menampilkan UI, *state management* (contoh: BLoCs, Provider, GetX), dan halaman-halaman aplikasi.
Contoh struktur proyek di dalam *feature/user* mencakup halaman (*page*), controller, dan widget.

2. *Domain Layer:*
Ini adalah lapisan terdalam yang tidak memiliki ketergantungan dengan lapisan lainnya. Berisi *business rule* aplikasi tanpa bergantung pada detail implementasi.
Contoh struktur proyek di dalam *domain/user* mencakup *entity*, *use cases*, dan repository.

3. *Data Layer:*
Mewakili lapisan data aplikasi. Terdapat implementasi *repository* (repository_impl), *DTO models* (dto), *data sources*, dan *mapper* untuk konversi antara *entitas* dan *model DTO*.
Contoh struktur proyek di dalam *data/user* mencakup *DTO models*, *data sources*, dan *repository*.

4. *Resources and Shared Library:*
Lapisan ini dapat diakses oleh semua lapisan lainnya. *Resources* berisi aset (gambar, font, warna, dll.), sedangkan *Shared Library* berisi komponen dan fungsionalitas yang dapat digunakan.

*Clean Architecture* membantu memisahkan konsep dan tanggung jawab. *Business rule* berada di lapisan domain, implementasi repositori di lapisan data, dan presentasi di lapisan feature. *Clean Architecture* membuat aplikasi lebih mudah dikembangkan dan rapih.

Source : [An Introduction to Flutter Clean Architecture](https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0)

## Membuat halaman tambah item dan memunculkan `pop-up` serta menyimpan data dari pengguna pada objek model.
1. Buat berkas baru pada direktori `lib` dengan nama `gameshop_form.dart` dan menambahkan kode berikut ke dalam file tersebut.
```dart
import 'package:flutter/material.dart';
import 'package:gameshop/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    @override
    Widget build(BuildContext context) {
        return Placeholder();
    }
}
```
2. Bagian `Placeholder` diubah dengan kode berikut yang berfungsi untuk menambahkan form dengan beberapa *input field*
```dart
Scaffold(
  appBar: AppBar(
    title: const Center(
      child: Text(
        'Form Tambah Item',
      ),
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  drawer: const LeftDrawer(),
  body: Form()
)
```
3. Buat variabel baru berisi `_formkey` dan tambahkan ke dalam atribut `key` milik widget `Form`. Atribut `key` akan berfungsi sebagai handler dari form state, validasi form, dan penyimpanan form.
```dart
class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
```
```dart
...
body: Form(
  key: _formKey,
  child: SingleChildScrollView(),
),
...
```
4. Mengisi widget `Form` dengan *field* seperti berikut:
```dart
class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
```
5. Membuat widget `TextFormField` yang dibungkus oleh `Padding` sebagai salah satu *children* dari widget `Column`. Setelah itu, tambahkan atribut `crossAxisAlignment` untuk mengatur *alignment* *children* dari `Column`.
```dart
...
child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Nama Produk",
              labelText: "Nama Produk",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Nama tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
...
```
6. Membuat dua `TextFormField` yang dibungkus dengan `Padding` sebagai child selanjutnya dari `Column` seperti sebelumnya untuk *field* `price` dan `description`.
```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Nama Item",
      labelText: "Nama Item",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _name = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Nama tidak boleh kosong!";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Harga",
      labelText: "Harga",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _price = int.parse(value!);
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Harga tidak boleh kosong!";
      }
      if (int.tryParse(value) == null) {
        return "Harga harus berupa angka!";
      }
      return null;
    },
  ),
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Deskripsi",
      labelText: "Deskripsi",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _description = value!;
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Deskripsi tidak boleh kosong!";
      }
      return null;
    },
  ),
),
```
Kode tersebut akan memvalidasi input dan menerima input dari pengguna.
7. Buatl tombol `Save` sebagai *child* selanjutnya dari `Column`. Bungkus tombol ke dalam widget Padding dan Align. Setelah itu, data akan digunakan dan disimpan agar dapat ditampilkan dalam *page* `Lihat Item`. Sebuah *pop-up* juga akan muncul setelah *input* dari pengguna berhasil masuk validasi.
```dart
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Item newItem = Item(
            name: _name,
            price: _price,
            description: _description,
          );

          // Use Provider to access the ItemModel and add the new item
          Provider.of<ItemModel>(context, listen: false)
              .addItem(newItem);

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Item berhasil tersimpan'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama: $_name'),
                      Text('Price: $_price'),
                      Text('Description: $_description')
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        }
        _formKey.currentState!.reset();
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
```
`Provider` digunakan untuk menyimpan data

## Mengarahkan pengguna ke halaman tambah *item* dan lihat *item*.
Di dalam file `menu.dart` sesuaikan *page* yang akan dimasukkan ke dalam *route stack* saat tombol tambah *item* atau liha *item* ditekan.
```dart
if (item.name == "Tambah Item") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ShopFormPage(),
    ),
  );
} else if (item.name == "Lihat Item") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          const ItemPage(), // Use 'items' instead of 'item'
    ),
  );
}
```

## Membuat drawer pada aplikasi
1. Buat file baru bernama `left_drawer.dart` dan tambhkan kode berikut.
```dart
import 'package:flutter/material.dart';
import 'package:gameshop/screens/menu.dart';
import 'package:gameshop/screens/gameshop_form.dart';
import 'package:gameshop/item_page.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
          ),
          // TODO: Bagian routing
        ],
      ),
    );
  }
}
```
2. *Routing* halaman yang sesuai dengan di dalam *drawer*.
```dart
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Halaman Utama'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
    );
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Lihat Item'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ItemPage(),
      ),
    );
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Tambah Item'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ShopFormPage(),
      ),
    );
  },
),
```
3. Menghias *drawer* dengan sesuai dengan kebutuhan.
```dart
const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.indigo,
  ),
  child: Column(
    children: [
      Text(
        'Game Shop',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Padding(padding: EdgeInsets.all(10)),
      Text(
        "Catat seluruh keperluan belanjamu di sini!",
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  ),
),
```
4. Menambahkan kode berikut untuk menampilkan *drawer* di *page* yang diinginkan.
```dart
drawer: const LeftDrawer(),
```
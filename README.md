Nama        : Clement Samuel Marly

NPM         : 2206082114

Kelas       : PBP C

[Web App](clement-samuel-tugas.pbp.cs.ui.ac.id)

Flutter App (TBA)

[Tugas 7](#tugas-7)

[Tugas 8](#tugas-8)

[Tugas 9](#tugas-9)

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

# Tugas 8
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
}
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
}
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
  ]
)
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

# Tugas 9
## Pengambilan data JSON tanpa membuat model terlebih dahulu
Pengambilan data JSON tanpa membuat model terlebih dahulu bisa dilakukan. Data JSON di-*deserialization* langsung, dimana data JSON dikonversi langsung menjadi objek tanpa model yang ditentukan. Kelemahan dari *deserialization* ini adalah data biasanya kurang terstruktur. Membuat model lebih baik karena memungkinkan struktur data yang jelas dan mempermudah dalam mengelola data.

## Fungsi dari CookieRequest
Merupakan objek yang berkaitan dengan permintaan HTTP yang menyimpan informasi *cookie*. Digunakan dalam Flutter untuk menyimpan atau mengelola *cookie* yang diperlukan untuk otorisasi atau autentikasi.
*Instance* `CookieRequest` dibagikan ke semua komponen di aplikasi Flutter agar dapat digunakan secara konsisten di seluruh aplikasi, memastikan bahwa *cookie* yang benar dan diperlukan dapat diakses atau diproses dengan benar.

## Mekanisme pengambilan data dari JSON dan penampilan data di flutter
1. Melakukan permintaan HTTP ke endpoint yang menyediakan data dalam format JSON. Hal ini dapat dilakukan dengan menggunakan file baru di /lib/models/<NAMA-MODEL>.dart dan isi sesuai dengan format json yang akan diterima melalui konversi di [Quicktype](https://app.quicktype.io)
2. Melakukan parsing (deserialization) respons JSON ke dalam struktur data yang dapat digunakan dalam aplikasi Flutter, seperti kode berikut yang didapatkan dari hasil konversi di [Quicktype](https://app.quicktype.io):
```dart
class Item {
  String model;
  int pk;
  Fields fields;

  Item({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  DateTime dateAdded;
  int amount;
  int price;
  String description;

  Fields({
    required this.user,
    required this.name,
    required this.dateAdded,
    required this.amount,
    required this.price,
    required this.description,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        amount: json["amount"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "price": price,
        "description": description,
      };
}
```
4. Menampilkan data tersebut di dalam widget sesuai dengan keinginan, seperti berikut:
```dart
class _ProductPageState extends State<ProductPage> {
  Future<List<Item>> fetchProduct() async {
    var url = Uri.parse('http://clement-samuel-tugas.pbp.cs.ui.ac.id/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }
}
```
```dart
children: [
  Text(
    "${snapshot.data![index].fields.name}",
    style: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  const SizedBox(height: 10),
  Text(
      "Amount         |    ${snapshot.data![index].fields.amount}"),
  const SizedBox(height: 10),
  Text(
      "Price              |    ${snapshot.data![index].fields.price}"),
  const SizedBox(height: 10),
  Text(
      "Description   |    ${snapshot.data![index].fields.description}")
],
```

## Mekanisme autentikasi akun pada Flutter ke Django
1. Menggunakan `provider` dan `pbp_django_auth` untuk integrasi autentikasi dari Django.
2. Mengirim data autentikasi berupa *username* dan *password* ke backend Django melalui permintaan HTTP, seperti pada kode berikut:
```dart
  String username = _usernameController.text;
  String password = _passwordController.text;

  final response = await request.login("http://clement-samuel-tugas.pbp.cs.ui.ac.id/auth/login/", {
  'username': username,
  'password': password,
  }
  )
```
3. Django akan mengecek data autentikasi yang dikirim dan jika *valid*, maka widget `Navigator` digunakan untuk *redirect* aplikasi Flutter ke `menu.dart`:
```dart
if (request.loggedIn) {
  String message = response['message'];
  String uname = response['username'];
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
  )
}
```

## *Used Widget*
1. **Scaffold**: 
Mengatur dasar aplikasi dengan `AppBar`, `Drawer`, dan `body`.
2. **Form**: 
Mengatur form untuk input data *item*.
3. **TextFormField**: 
Widget input teks untuk mengumpulkan data, seperti nama *item*, jumlah, harga, dan deskripsi.
4. **ElevatedButton**: 
Tombol *elevated* yang digunakan untuk menyimpan data *item* yang dimasukkan.
5. **SnackBar**: 
Menampilkan notifikasi setelah berhasil menyimpan *item* atau jika terdapat kesalahan.
6. **FutureBuilder**: 
Mengelola tampilan berdasarkan status future untuk mendapatkan dan menampilkan data *item* secara asinkronus.
7. **ListView.builder**: 
Menampilkan daftar *item* dalam bentuk list yang dapat di-*scroll*.
8. **MaterialApp**: 
Widget *root* yang menentukan tema dan halaman awal aplikasi.
9. **Provider**: 
Digunakan untuk menyediakan *instance* CookieRequest ke seluruh aplikasi menggunakan `Provider`.
10. **Column**: 
Menyusun widget secara vertikal.
11. **GridView.count**: 
Menampilkan daftar *item* dalam grid layout.
12. **ShopCard**: 
Widget custom untuk menampilkan setiap *item* dalam bentuk card.
13. **Material**: 
Mengatur warna background *item* di dalam grid.
14. **InkWell**: 
Widget responsif terhadap sentuhan pengguna.
15. **Icon**: 
Menampilkan ikon *item*.
16. **Text**: 
Menampilkan nama *item*.
18. **ListView**: 
Menampilkan daftar opsi menu dalam *drawer*.
19. **ListTile**: 
Membuat opsi menu dalam *drawer*.
20. **Navigator**: 
Bertanggung jawab untuk menavigasi antar halaman dalam aplikasi.

dan lainnya.

## Membuat halaman login pada aplikasi Flutter
1. Instalasi *package* yang sesuai untuk autentikasi *user* melalui perintah berikut:
```shell
flutter pub add provider
flutter pub add pbp_django_auth
```
2. Memodifikasi `main.dart` agar bisa menyediakan `CookieRequest` *library* ke semua *child widgets* dengan menggunakan `Provider` melalui pengubahan kelas `MyApp`.
```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
          ),
          home: const LoginPage()),
    );
  }
}
```
Jangan lupa untuk mengubah bagian `home:` ke halaman login yang akan dibuat.
3. Buat *file* baru dengan nama `login.dart` di *folder* `screens` dengan isi seperti berikut:
```dart
import 'package:gameshop/screens/menu.dart';
import 'package:gameshop/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Cek kredensial
                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                // gunakan URL http://10.0.2.2/
                final response =
                    await request.login("http://localhost:8000/auth/login/", {
                  'username': username,
                  'password': password,
                });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  int id = response['id'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(id: id)),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$message Selamat datang, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
            SizedBox(height: 20),
            Text(
              'Don`t have an account yet?',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to registration page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationPage()),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
```
Ada tambahan `register` dan `id` untuk *parameter passing*. Sesuikan `url` dengan tempat menjalankan proyek Django atau `url` yang sudah di-*deploy*
5. Jalankan aplikasi Flutter dan proyek DJango apabila menggunakan `localhost` untuk mengecek apakah aplikasi dapat login atau tidak.

## Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter
1. Buat sebuah `django-app` baru dengan nama `authentication` pada proyek Django sebelumnya.
2. Tambahkan `authentication` ke `INSTALLED_APPS` pada *main project* `settings.py` aplikasi Django.
3. Jalankan perintah `pip install django-cors-headers` untuk menginstal *library* yang dibutuhkan.
4. Tambahkan `corsheaders` ke `INSTALLED_APPS` pada *main project* `settings.py` aplikasi Django.
5. Tambahkan `corsheaders.middleware.CorsMiddleware` pada *main project* `settings.py` aplikasi Django.
6. Tambahkan beberapa variabel berikut ini pada *main project* `settings.py` aplikasi Django.
```python
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
7. Tambahkan `django-cors-headers` di requirements.txt 
8. Buat sebuah fungsi baru untuk login di `authentication/views.py`.
```python
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```
9. Buat *file* `urls.py` pada *folder* `authentication` dan tambahkan URL *routing* pada fungsi yang baru dibuat.
```python
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```
10. Tambahkan `path('auth/', include('authentication.urls')),` pada file `main/urls.py`.

## Membuat model kustom sesuai dengan proyek Django
1. Buka *endpoint* JSON yang sudah dibuat sebelumnya dan salin data tersebut ke dalam [Quicktype](https://app.quicktype.io). Sesuaikan parameter di dalam [Quicktype](https://app.quicktype.io) dengan kebutuhan (*setup name*, *source type*, dan *language*)
2. Salin hasil konversi dari [Quicktype](https://app.quicktype.io) ke dalam *file* baru bernama `item.dart` di *folder* baru di dalam `lib` (`lib/models/item.dart`). Hasil konversi dapat dilihat sebagai berikut.
```dart
class Item {
  String model;
  int pk;
  Fields fields;

  Item({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  DateTime dateAdded;
  int amount;
  int price;
  String description;

  Fields({
    required this.user,
    required this.name,
    required this.dateAdded,
    required this.amount,
    required this.price,
    required this.description,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        amount: json["amount"],
        price: json["price"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "price": price,
        "description": description,
      };
}
```
3. Menampilkan data tersebut di dalam widget sesuai dengan keinginan, seperti berikut:
```dart
class _ProductPageState extends State<ProductPage> {
  Future<List<Item>> fetchProduct() async {
    var url = Uri.parse('http://clement-samuel-tugas.pbp.cs.ui.ac.id/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }
}
```
```dart
children: [
  Text(
    "${snapshot.data![index].fields.name}",
    style: const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  const SizedBox(height: 10),
  Text(
      "Amount         |    ${snapshot.data![index].fields.amount}"),
  const SizedBox(height: 10),
  Text(
      "Price              |    ${snapshot.data![index].fields.price}"),
  const SizedBox(height: 10),
  Text(
      "Description   |    ${snapshot.data![index].fields.description}")
],
```

## Membuat halaman yang berisi daftar semua item
1. Buat *file* baru pada *folder* `lib/screens` dengan nama `list_item.dart`. Lalu, tambahkan *import* yang sesuai.
```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gameshop/models/item.dart';
import 'package:gameshop/widgets/left_drawer.dart';
import 'package:gameshop/screens/item_detail.dart';
```
2. Tambahkan kode berikut untuk menampilkan data - data yang sesuai dengan parameter tambahan `id` untuk melakukan `filter` sesuai dengan *item* yang ditambahkan oleh tiap pengguna.
```dart
class ProductPage extends StatefulWidget {
  final int id;
  const ProductPage({Key? key, required this.id}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<List<Item>> fetchProduct() async {
    final int id = widget.id;
    var url = Uri.parse('http://localhost:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Item> list_product = [];
    for (var d in data) {
      if (d != null && d['fields']['user'] == id) {
        list_product.add(Item.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    final int id = widget.id;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        drawer: LeftDrawer(id: id),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman detail saat item ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemDetail(item: snapshot.data![index]),
                          ),
                        );
                      },
                      child: Container(
                        // Widget item yang dapat ditekan
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                                "Amount         |    ${snapshot.data![index].fields.amount}"),
                            const SizedBox(height: 10),
                            Text(
                                "Price              |    ${snapshot.data![index].fields.price}"),
                            const SizedBox(height: 10),
                            Text(
                                "Description   |    ${snapshot.data![index].fields.description}")
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
```
3. Tambahkan halaman `list_item.dart` ke dalam `left_drawer.dart` menggunakan *widget* `Navigator`.
4. Ubah fungsi *button* `Item List` pada halaman utama dan sesuaikan *import* dari setiap *file*.

## Membuat halaman detail untuk tiap item
1. Membuat *file* baru dengan nama `item_detail.dart` dan *import* *file* tersebut ke dalam `list_item.dart`.
2. Isi file dengan kode berikut untuk menunjukkan *detail* item secara spesifik.
```dart
import 'package:flutter/material.dart';
import 'package:gameshop/models/item.dart'; // Import model Item untuk digunakan di halaman detail

class ItemDetail extends StatelessWidget {
  final Item item; // Terima objek Item dari halaman sebelumnya

  const ItemDetail({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
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
          ],
        ),
      ),
    );
  }
}
```
3. Menggunakan `GestureDetector` untuk mengetahui adanya interaksi dari *user* dan menambahkan *route* ke `ItemDetail` dari *file* `item_detail.dart` untuk menampilkan *detail* *item* secara spesifik.
```dart
itemBuilder: (_, index) => GestureDetector(
  onTap: () {
    // Navigasi ke halaman detail saat item ditekan
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ItemDetail(item: snapshot.data![index]),
      ),
    );
  },
  child: Container(
    // Widget item yang dapat ditekan
    margin: const EdgeInsets.symmetric(
        horizontal: 16, vertical: 12),
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${snapshot.data![index].fields.name}",
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
            "Amount         |    ${snapshot.data![index].fields.amount}"),
        const SizedBox(height: 10),
        Text(
            "Price              |    ${snapshot.data![index].fields.price}"),
        const SizedBox(height: 10),
        Text(
            "Description   |    ${snapshot.data![index].fields.description}")
      ],
    ),
  ),
),
```

# Terima kasih
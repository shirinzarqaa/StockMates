<details>
<summary>Tugas 7</summary>

# Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

**statelessWidget** adalah widget yang tidak dapat berubah sepanjang siklus hidupnya
**statefullWidget** adalah widget yang dapat berubah selama aplikasi berjalan dan memiliki state yang terait dengannya

# Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

- **MyApp (main.dart)**
root widget aplikasi yang mewakili seluruh aplikasi. Ini adalah bagian utama dari aplikasi yang diinisialisasi dalam fungsi main().
Mengatur tema dan konfigurasi aplikasi.

- **Scaffold (menu.dart)**
kerangka aplikasi yang menyediakan struktur umum, termasuk AppBar dan halaman.
Anda mengatur judul aplikasi di dalam AppBar.

- **SingleChildScrollView (menu.dart)**
widget yang memungkinkan isi halaman untuk discroll ketika diperlukan dan bisa membungkus seluruh konten aplikasi.

- **Padding (menu.dart)**
Padding digunakan untuk menambahkan padding ke dalam widget untuk mengatur jarak dari tepi halaman.

- **Column (menu.dart)**
Column digunakan untuk menampilkan children secara vertikal di app ini saya menggabungkan konten aplikasi dalam Column untuk menjadikannya tampilan vertikal.

- **GridView.count (menu.dart)**
untuk membuat grid layout yang berisi tombol-tombol.

- **ShopCard (menu.dart)**
widget yang saya buat sendiri untuk merepresentasikan setiap tombol.

- **InkWell (menu.dart)**
untuk memberikan respons ketika tombol ditekan. saya mengimplementasikan onTap di sini untuk menampilkan SnackBar saat tombol ditekan.

- **SnackBar (menu.dart)**
untuk menampilkan pesan interaktif yang muncul sementara di bagian bawah layar, saya menggunakannya untuk menampilkan pesan yang sesuai saat tombol ditekan.
# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- tulis flutter create stock_mates diterminal
- tulis cd stock_mates diterminal
- tulis flutter run di terminal
- tulis flutter run -d chrome di terminal
- buat file menu dart dan import import 'package:flutter/material.dart';
- perbaiki struktur code di main.dart seperti ini
import 'package:flutter/material.dart';
import 'package:stock_mates/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

- perbaiki struktur code di menu.dart seperti ini (notes : saya menambah cardColor untuk bonus )
import 'package:flutter/material.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color cardColor;

  ShopItem(this.name, this.icon, this.cardColor);
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.indigo), // Warna sesuai dengan preferensi Anda
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.green), // Warna sesuai dengan preferensi Anda
    ShopItem("Logout", Icons.logout, Colors.red), // Warna sesuai dengan preferensi Anda
  ];


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
    Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stock mates',
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
                  'StockMates Shop', // Text yang menandakan toko
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
                  return ShopCard(item, item.cardColor);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final Color cardColor;

  const ShopCard(this.item, this.cardColor, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cardColor,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}")));
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

- tugas selesai dan lakukan git add . , git commit -m "selesai" , git push origin master
# sudah mengerjakan bonus dengan pemberian warna yg berbeda

</details>
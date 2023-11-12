<details>
<summary>Tugas 7</summary>

# Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

- **statelessWidget** 
Widget tanpa keadaan (stateless) tidak memiliki keadaan internal yang dapat berubah selama masa hidupnya.
Mereka hanya memiliki properti yang ditentukan selama konstruksi dan tidak bisa diubah setelahnya.
Stateless widget cocok digunakan untuk tampilan yang tidak berubah atau bergantung pada properti yang diberikan pada saat pembuatan widget. Contohnya adalah teks statis, ikon, atau widget yang tidak memerlukan interaksi pengguna.
Stateful Widget:
- **statefullWidget** 
Widget dengan keadaan (stateful) memiliki keadaan internal yang dapat berubah selama masa hidupnya.
Keadaan internal dapat diubah berdasarkan peristiwa atau interaksi pengguna, dan widget ini dapat diperbarui untuk mencerminkan perubahan tersebut.
Stateful widget cocok digunakan untuk tampilan yang perlu berubah atau menanggapi perubahan, seperti daftar item dinamis, formulir, atau widget yang berinteraksi dengan data eksternal.

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
```
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
```
- perbaiki struktur code di menu.dart seperti ini (notes : saya menambah cardColor untuk bonus )
```
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
```

- tugas selesai dan lakukan git add . , git commit -m "selesai" , git push origin master
# sudah mengerjakan bonus dengan pemberian warna yg berbeda

</details>

<details>
<summary>Tugas 8</summary>

# Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

## Navigator.push()
1. menambahkan layar baru ke tumpukan navigasi.
2. dapat menggunakan metode Navigator.pop() untuk kembali ke layar sebelumnya 
```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
```
## Navigator.pushReplacement()
1. menggantikan layar saat ini dalam tumpukan navigasi dengan layar baru.Hal ini berarti, layar yang baru ditumpuk ke atas layar yang saat ni ditampilkan, dan layar yang saat ini hilang dari tumpukan
2. tidak bisa kembali ke layar sebelumnya yang berarti metode Navigator.pop() tidak berfungsi 
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
```
# Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

## Single-child layout widgets
**Align**
Widget Align digunakan untuk mengatur tata letak widget child dalam container dengan presisi berdasarkan Alignment yang ditentukan. 
```
Align(
  alignment: Alignment.center,
  child: Text('Tengah'),
)
```
**AspectRatio**
Widget AspectRatio digunakan untuk mengatur perbandingan aspek widget child. Ini berguna dalam situasi seperti menampilkan gambar dengan perbandingan aspek tertentu. 

```
AspectRatio(
  aspectRatio: 16/9,
  child: Image.asset('gambar.jpg'),
)
```
**Baseline**
Widget Baseline digunakan untuk mengatur widget child berdasarkan garis dasar teks tertentu. Ini berguna saat ingin menyelaraskan teks dalam baris yang berbeda. 
```
Baseline(
  baseline: 18.0,
  baselineType: TextBaseline.alphabetic,
  child: Text('Teks di Dasar'),
)
```
**Center**
Widget Center digunakan untuk secara sederhana menempatkan widget child di tengah container. 
```
Center(
  child: Text('Tengahkan Teks'),
)
```
**ConstrainedBox**
Widget ConstrainedBox digunakan untuk membatasi ukuran widget child dengan batasan yang ditentukan. Ini berguna saat ingin membatasi ukuran widget.
```
ConstrainedBox(
  constraints: BoxConstraints(
    maxWidth: 200,
    maxHeight: 100,
  ),
  child: Text('Teks Terbatas'),
)

```
**Container**
Widget Container digunakan untuk mengelompokkan widget dengan dekorasi tertentu seperti warna latar belakang, batasan, atau jarak. 
```
Container(
  color: Colors.blue,
  width: 100,
  height: 100,
  child: Text('Kotak di dalam Container'),
)

```
**CustomSingleChildLayout**
Widget CustomSingleChildLayout berguna untuk membuat tata letak yang disesuaikan dengan tata letak satu child. 
**Expanded**
Widget Expanded digunakan untuk mengisi ruang kosong dalam widget parent dengan widget child. Ini berguna dalam kasus widget kolom atau baris.
```
Row(
  children: [
    Expanded(
      child: Text('Kiri'),
    ),
    Expanded(
      child: Text('Kanan'),
    ),
  ],
)

```
**FittedBox**
Widget FittedBox mengatur widget child dalam kotak yang diberikan dengan mempertahankan perbandingan aspek child. 
```
FittedBox(
  fit: BoxFit.cover,
  child: Image.asset('gambar.jpg'),
)

```
**FractionallySizedBox**
Widget FractionallySizedBox digunakan untuk mengatur ukuran widget child dalam fraksi dari ukuran parent. 
```
FractionallySizedBox(
  widthFactor: 0.5,
  heightFactor: 0.3,
  child: Container(color: Colors.green),
)

```
**IntrinsicHeight**
Widget IntrinsicHeight digunakan untuk memaksa tinggi widget child sesuai dengan tinggi terbesar dari semua widget child di dalamnya. 
```
IntrinsicHeight(
  child: Column(
    children: [
      Text('Teks 1'),
      Text('Teks 2 yang lebih panjang'),
      Text('Teks 3'),
    ],
  ),
)
```
**IntrinsicWidth**
Widget IntrinsicWidth bekerja dengan prinsip yang sama seperti IntrinsicHeight, tetapi untuk lebar. 
**LimitedBox**
Widget LimitedBox digunakan untuk membatasi ukuran widget child ke ukuran tertentu.
```
LimitedBox(
  maxHeight: 100,
  child: Text('Teks Terbatas'),
)
```
**Offstage**
Widget Offstage digunakan untuk menyembunyikan widget child secara efisien tanpa membebani layout. Ini berguna untuk menonaktifkan widget sementara tanpa menghapusnya dari pohon widget. 
```
Offstage(
  offstage: true, // Atur ke false untuk menampilkan widget
  child: Text('Teks Tersembunyi'),
)
```
**OverflowBox**
Widget OverflowBox memungkinkan widget child untuk melebihi batas widget parent tanpa mengubah ukuran parentnya. Ini berguna saat  ingin membuat efek seperti teks yang meluber dari kotaknya.
```
OverflowBox(
  maxHeight: 100,
  maxWidth: 100,
  child: Text('Teks yang Terlalu Besar'),
)
```
**Padding**
Widget Padding digunakan untuk menambahkan ruang kosong (padding) di sekeliling widget child.
```
Padding(
  padding: EdgeInsets.all(16.0),
  child: Text('Teks dengan Padding'),
)
```
**SizedBox**
Widget SizedBox digunakan untuk mengatur ukuran widget child ke ukuran tertentu, baik tinggi maupun lebar. 
```
SizedBox(
  width: 100,
  height: 50,
  child: Container(color: Colors.red),
)
```
**SizedOverflowBox**
Widget SizedOverflowBox bekerja seperti OverflowBox, tetapi dapat menentukan ukuran yang tepat untuk widget parent. Ini berguna saat ingin mengontrol ukuran widget parent dan mengizinkan widget child meluber. 
```
SizedOverflowBox(
  size: Size(100, 100),
  child: Text('Teks yang Terlalu Besar'),
)
```
**Transform**
Widget Transform digunakan untuk mengubah atau memutar widget child. Ini memungkinkan untuk melakukan transformasi seperti rotasi, skalasi, atau pemindahan.
```
Transform.rotate(
  angle: 45 * math.pi / 180, // Rotasi 45 derajat
  child: Text('Teks Terputar'),
)
```

## Multi-child layout widgets
**Column**
Digunakan untuk mengatur widget dalam satu kolom vertikal 
```
Column(
  children: <Widget>[
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```
**CustomMultiChildLayout**
Digunakan untuk mengatur tata letak dengan kontrol penuha tas posisi anak-anaknya.
```
CustomMultiChildLayout(
  delegate: MyDelegate(),
  children: <Widget>[
    LayoutId(
      id: MyId.child1,
      child: Text('Child 1'),
    ),
    LayoutId(
      id: MyId.child2,
      child: Text('Child 2'),
    ),
  ],
)
```
**Flow**
Digunakan untuk mengatur widget dalam tanpa memperhatikan dimensi anak-anak
```
Flow(
  delegate: MyFlowDelegate(),
  children: <Widget>[
    Container(width: 100, height: 100, color: Colors.blue),
    Container(width: 50, height: 50, color: Colors.red),
    Container(width: 80, height: 80, color: Colors.green),
  ],
)
```
**GridView**
Mengatur widget dalam bentuk grid dengan berbagai opsi.
```
GridView.count(
  crossAxisCount: 2, // Jumlah kolom
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```
**IndexedStack**
Menunjukkan hanya satu anak pada suatu waktu berdasarkan indeksnya.Berguna untuk tata letak yang berbeda saat tampilan berubah.
```
IndexedStack(
  index: 0, // Indeks anak yang ditampilkan
  children: <Widget>[
    Text('Page 1'),
    Text('Page 2'),
    Text('Page 3'),
  ],
)
```
**LayoutBuilder**
Memungkinkan anda membuat tata letak yang responsif dengan mengakses informasi tentang batasan yang diberikan oleh parent widget.
```
LayoutBuilder(
  builder: (context, constraints) {
    return Text('Lebar: ${constraints.maxWidth}, Tinggi: ${constraints.maxHeight}');
  },
)
```
**ListBody**
Mengatur widget dalam satu kolom vertikal dengan beberapa aturan tata letak tambahan.
```
ListBody(
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```
**ListView**
Membungkus daftar widget dalam tampilan berulir yang dapat di-scroll.
```
ListView(
  children: <Widget>[
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3')),
  ],
)
```
**Row**
Digunakan untuk mengatur widget dalam satu baris horizontal.
```Row(
  children: <Widget>[
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```
**Stack**
memungkinkan menumpuk anak-anak dalam tumpukan dengan kontrol atas tumpukan dan posisi mereka.
```
Stack(
  children: <Widget>[
    Container(color: Colors.blue, height: 100, width: 100),
    Container(color: Colors.red, height: 50, width: 50),
  ],
)
```
**Table**
Mengatur data dalam bentuk tabel dengan baris dan kolom. Berguna untuk menampilkan data yang terstruktur.
```
Table(
  children: <TableRow>[
    TableRow(
      children: <Widget>[
        Text('Nama'),
        Text('Usia'),
      ],
    ),
    TableRow(
      children: <Widget>[
        Text('John'),
        Text('30'),
      ],
    ),
    TableRow(
      children: <Widget>[
        Text('Alice'),
        Text('25'),
      ],
    ),
  ],
)
```
**Wrap**
Mengatur widget dalam baris horizontal atau vertikal, melingkar jika melebihi lebar atau tinggi yang tersedia.
```Wrap(
  children: <Widget>[
    Chip(label: Text('Tag 1')),
    Chip(label: Text('Tag 2')),
    Chip(label: Text('Tag 3')),
  ],
)
```
## Silver Widgets
**CupertinoSliverNavigationBar**
Memberikan tampilan navigasi bergaya iOS dengan efek tersembunyi saat menggulir.
**CustomScrollView**
Digunakan untuk membuat tampilan berulir yang kompleks dengan menggabungkan berbagai sliver widgets.
**SliverAppBar**
Mengontrol elemen app bar dengan efek tersembunyi saat menggulir pada tampilan berulir.
```
CustomScrollView(
  slivers: <Widget>[
    SliverAppBar(
      title: Text('My App Bar'),
      expandedHeight: 200,
      flexibleSpace: Image.network('https://example.com/image.jpg', fit: BoxFit.cover),
    ),
  ],
)
```
**SliverChildBuilderDelegate**
Membuat daftar elemen yang berasal dari generator fungsi builder.
```
SliverList(
  delegate: SliverChildBuilderDelegate((context, index) {
    return ListTile(title: Text('Item $index'));
  }),
)
```
**SliverChildListDelegate**
Membuat daftar elemen yang berasal dari daftar widget yang diberikan.
```
SliverList(
  delegate: SliverChildListDelegate([
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3')),
  ]),
)
```
**SliverGrid**
Mengorganisir elemen-elemen dalam bentuk grid di dalam CustomScrollView.
```
SliverGrid(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // Jumlah kolom
  ),
  delegate: SliverChildBuilderDelegate((context, index) {
    return Container(color: Colors.blue);
  }),
)
```
**SliverList**
Membuat daftar elemen dalam CustomScrollView.
```SliverList(
  delegate: SliverChildBuilderDelegate((context, index) {
    return ListTile(title: Text('Item $index'));
  }),
)
```
**SliverPadding**
Menambahkan jarak antara elemen-elemen dalam CustomScrollView.
```
SliverPadding(
  padding: EdgeInsets.all(16.0),
  sliver: SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return ListTile(title: Text('Item $index'));
    }),
  ),
)
```
**SliverPersistentHeader**
Membuat header yang tetap di atas saat menggulir dalam CustomScrollView.
```
SliverPersistentHeader(
  pinned: true, // Header akan tetap ada saat digulir
  delegate: MyHeaderDelegate(),
)
```
**SliverToBoxAdapter**
Mengubah widget non-sliver menjadi sliver untuk dimasukkan ke dalam CustomScrollView.
```
SliverToBoxAdapter(
  child: Container(
    height: 200,
    color: Colors.blue,
  ),
)
```

# Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
1. **TextFormField untuk Nama Produk**
- Digunakan untuk menginputkan nama produk.
- Digunakan sebagai name dalam objek Stock.
- Validation digunakan untuk memastikan bahwa input tidak boleh kosong.
  
2. **TextFormField untuk Harga**
- Digunakan untuk menginputkan harga produk.
- Digunakan sebagai price dalam objek Stock.
- Validation digunakan untuk memastikan bahwa input tidak boleh kosong dan harus berupa angka.


3. **TextFormField untuk Jumlah**
Digunakan untuk menginputkan jumlah produk*
Digunakan sebagai amount dalam objek Stock.
Validation digunakan untuk memastikan bahwa input tidak boleh kosong dan harus berupa angka.
TextFormField untuk Deskripsi:

4. **Digunakan untuk menginputkan deskripsi produk**
- Digunakan untuk menginputkan deskripsi produk.
- Digunakan sebagai description dalam objek Stock.
- Validation digunakan untuk memastikan bahwa input tidak boleh kosong.

# Bagaimana penerapan clean architecture pada aplikasi Flutter?**
1. **Tentukan Struktur Proyek**
Bagi proyek menjadi beberapa modul atau paket yang mewakili berbagai lapisan clean architecture seperti Domain, Data, dan Presentation.
2. **Lapisan Domain**
Berisi entitas (Mewakili objek bisnis inti aplikasi), use cases (Mendefinisikan logika bisnis dan operasi yang terkait dengan aplikasi), dan abstraksi repository (Menggambarkan abstraksi untuk mengakses data dan sumber daya eksternal).
3. **Lapisan Data**
Lapisan ini bertanggung jawab atas implementasi concrete dari repository yang didefinisikan di lapisan domain dan berisi implementasi sumber data eksternal seperti API, database, atau penyimpanan lokal.
4. **Lapisan Presentation**
Lapisa yang bertanggung jawab atas semua hal terkait tampilan dan interaksi pengguna. Termasuk widget UI, Logika presentasi, dan manajemen state (dapat menggunakan arsitektur seperti Bloc,Provider, atau MobX).
5. **Dependency Injection (DI)**
Dependency Injection digunakan untuk memasukkan dependensi ke dalam kelas yang kita punya.
6. **Testability**
7. unit test untuk logika bisnis (use cases) dan gunakan framework pengujian untuk menguji widget dan komponen UI.
8. **Management State**
penggunaan manajemen state untuk mengisolasi logika presentasi dan memastikan tampilan tetap bersih.
9.  **Model View Presenter (MVP) atau Model View ViewModel (MVVM)**
Mempertimbangkan penggunaan pola arsitektur ini untuk memisahkan tampilan dari logika aplikasi.
10. **UI terpisah dari bisnis logic**
tampilan hanya untuk menampilkan data dan merespons input, sedagkan logika bisnis ada di lapisan yang lebih dalam.
11. **Handling Error**
menangani error dan memberikan alert ke pengguna.
12. **Routing dan Navigasi**
Mengatur navigasi.

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
1. membuat file baru dengan nama stockmates_form.dart di direktori lib/screens dan menambahkan kode berikut di dalam file tersebut:
```
import 'package:flutter/material.dart';
import 'package:stock_mates/widgets/left_drawer.dart';
import 'package:stock_mates/screens/menu.dart';
import 'package:stock_mates/screens/daftarlist.dart';
import 'package:stock_mates/models/stockmates_model.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  int _amount = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      endDrawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:Column(
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
                      return "Nama Produk tidak boleh kosong!";
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
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah harus berupa angka!";
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        var stock = Stock(name: _name, price: _price,amount: _amount, description: _description);
                        dataStockMates.add(stock);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: $_price'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyHomePage(),
                                    ));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      _formKey.currentState!.reset();
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}
```
2. Membuat folder baru dengan nama widgets di direktori lib dan membuat file baru dengan nama shop_card.dart dan menambahkan kode berikut :
```
import 'package:stock_mates/screens/daftarlist.dart';
import 'package:stock_mates/screens/stockmates_form.dart';
import 'package:flutter/material.dart';
class ShopItem {
  final String name;
  final IconData icon;
  final Color cardColor;

  ShopItem(this.name, this.icon,this.cardColor);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.cardColor,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Lihat Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder:  (context) => const DataStockPage(),
                ));
          }

          if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder:  (context) => const ShopFormPage(),
                ));
          }


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
3. buka file daftarlist_form.dart dan menambahkan kode berikut di antara kode dataStockMates.add(stock); dan _formKey.currentState!.reset(); :
```showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Produk berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $_name'),
                                    Text('Harga: $_price'),
                                    Text('Jumlah: $_amount'),
                                    Text('Deskripsi: $_description'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyHomePage(),
                                    ));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      _formKey.currentState!.reset();
``` 
4. membuat file baru dengan nama left_drawer.dart di direktori lib/widgets dan menambahkan kode berikut di dalamnya :
   
```
import 'package:flutter/material.dart';
import 'package:stock_mates/screens/menu.dart';
import 'package:stock_mates/screens/stockmates_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Stock Mates List',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh keperluan belanjamu di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                    ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ShopFormPage())
              );
            },
          ),

        ],
      ),
    );
  }
}
```
**Bonus**
5. membuat file model baru dengan nama stockmates_model.dart di direktori lib/models dan menambahkan kode berikut di dalamnya :
  
import 'package:flutter/material.dart';

class Stock {
  String? name;
  int? price;
  int? amount;
  String? description;

  Stock({
    required this.name,
    required this.price,
    required this.amount,
    required this.description,
  });

  Widget show() {
      return Card(
        color: const Color.fromARGB(255, 253, 253, 253),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          
          side: const BorderSide(
            color: Color.fromARGB(255, 156, 156, 156),
          ),
        ),
        elevation: 2,
        shadowColor: Colors.black,
        child: ListTile(
          title: Text(
            "$name",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 3, 3, 3)
            ),
          ),
          subtitle: Text(
            "$description\nJumlah: $amount \nHarga: $price"
            )
        ),
      );
    }
}

</details>

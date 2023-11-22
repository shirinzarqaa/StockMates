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

<details>
<summary>Tugas 9</summary>

# Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, mengambil data JSON tanpa membuat model terlebih dahulu. Hal ini bisa di lakukan dengan cara parsing data JSON kedalam struktur data.

Pengambilan data JSON bisa lebih baik daripada membuat model itu tergantung pada kontesnya.

**Keuntungan menggunakan model**
- dapat membantu dalam validasi data
- dapat mengakses data menggunakan properti objek, yang bisa lebih intuitif dan mudah dibaca darpada mengakses nilai melalui key dictionary.
- Model dapat memberikan struktur yang jelas untuk data sehingga dapat membantu pemahaman dokumentasi dan pemahaman data.

**Keuntungan tidak menggunakan model**
- fleksibilas 
- lebih cepat dan lebih mudah untuk mulai bekerja dengan data tanpa menghabiskan waktu untuk mendefinisikan model terlebih dahulu

# Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Kelas CookieReguest merupakan bagian dari implementasi authentication pada aplikasi flutter dengan menggunakan cookies. fungsionalitas utama dari kelas ini :

**Inisialisasi dan Pemeliharaan Cookies:**
Suatu kelas memiliki metode init() yang berfungsi untuk memulai dan menjaga status cookies. Ini mencakup langkah-langkah seperti membaca cookies yang telah disimpan sebelumnya, memeriksa apakah sesi pengguna sudah masuk, dan mengelola header yang berisi informasi cookie.

**Request HTTP dengan Otentikasi:**
Kelas ini memiliki beberapa metode untuk melakukan permintaan HTTP, seperti get, post, dan postJson. Semua metode ini menyertakan informasi otentikasi dalam header HTTP jika pengguna sudah masuk.

**Manajemen Sesi Pengguna:**
Kelas ini menyediakan fungsionalitas untuk masuk dan keluar. Metode masuk digunakan untuk mengirimkan permintaan masuk ke server, dan jika berhasil, menyimpan cookies dan status masuk. Metode keluar digunakan untuk melakukan keluar, menghapus cookies, dan mengubah status masuk.

**Penanganan Cookies:**
Kelas ini memiliki fungsi-fungsi untuk mengelola cookies, termasuk membaca dari penyimpanan lokal (shared preferences), pembaruan berdasarkan respons HTTP, dan pembuatan header cookie.

**Keamanan dan Pengaturan Cookies:**
Fungsi _setCookie digunakan untuk mengurai dan menyimpan properti cookies, termasuk waktu kedaluwarsa (max-age). Fungsi _generateCookieHeader digunakan untuk membuat header cookie yang akan dimasukkan dalam setiap permintaan HTTP.

Mengapa perlu dibagikan ke semua komponen di aplikasi Flutter?

**Pemeliharaan Status Login:**
Dengan membagikan instance CookieRequest ke semua komponen, kita dapat memastikan bahwa status login pengguna dapat diakses dan diperbarui secara konsisten di seluruh aplikasi. Ini penting agar komponen-komponen yang berbeda dapat merespons perubahan status login dengan benar.

**Pengelolaan Otentikasi:**
Instance CookieRequest menyimpan informasi otentikasi dan cookies. Dengan membagikannya ke berbagai komponen, kita dapat mengakses informasi otentikasi ini dari mana saja dalam aplikasi, memungkinkan komunikasi yang efektif dengan server dan pemeliharaan otentikasi.

**Pemrosesan Permintaan HTTP:**
Dengan menyediakan instance CookieRequest ke berbagai komponen, setiap komponen dapat melakukan permintaan HTTP dengan otentikasi tanpa perlu mengulang kembali proses autentikasi. Ini meningkatkan efisiensi dan mengurangi redundansi kode.

**Manajemen Cookies yang Konsisten:**
Melalui instance CookieRequest, komponen-komponen dapat mengakses dan memanipulasi cookies secara konsisten. Ini membantu dalam penanganan cookies dan menjaga konsistensi antara komponen-komponen yang berbeda.

# Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Data diambil melalui respons dari URL yang telah ditentukan dalam proyek Django. Selanjutnya, respons tersebut diuraikan (decoded) menjadi format JSON. Setelah itu, dibuatlah sebuah daftar (list) item yang berisi objek-objek Item. Masing-masing objek ini berasal dari hasil dekoding JSON sebelumnya. Proses ini dilakukan melalui iterasi, dimana setiap item dimasukkan ke dalam list item.

Untuk mendapatkan hasil dari pengambilan item, kita menggunakan FutureBuilder. Fungsi ini memungkinkan kita untuk memanggil hasil dari fungsi asinkron (async) yang melakukan pengambilan item. Hasil dari proses ini kemudian ditampilkan melalui ListView.builder, yang memungkinkan pembuatan tampilan dinamis berdasarkan data yang diterima.

# Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Pengguna memasukkan username dan password melalui TextField di dalam framework Flutter, dan data ini disimpan dalam variabel username dan password. Ketika tombol login ditekan, aplikasi mengirimkan permintaan HTTP POST ke endpoint /auth/login/ di server Django. Data username dan password dikirimkan sebagai bagian dari body permintaan dalam format JSON.

Server Django menerima permintaan dan melakukan proses autentikasi terhadap pengguna. Jika autentikasi berhasil, Django mengirimkan respon yang berisi pesan sukses dan data pengguna. Namun, jika autentikasi gagal, Django mengirimkan respon dengan pesan kesalahan. Aplikasi Flutter menerima respon dari Django dan memeriksa apakah autentikasi berhasil. Jika berhasil, aplikasi akan mengarahkan pengguna ke halaman utama (MyHomePage); sebaliknya, jika gagal, aplikasi akan menampilkan pesan kesalahan.

Setelah pengguna berhasil login, mereka akan diarahkan ke halaman utama aplikasi di mana menu aplikasi ditampilkan.

#  Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

- **AppBar:**
AppBar menampilkan widget toolbar, leading, title, dan actions di atas bagian bawah (jika ada).

- **Column:**
Widget yang menampilkan anak-anaknya dalam susunan vertikal.

- **Scaffold:**
Scaffold adalah kelas dalam Flutter yang menyediakan banyak widget atau API seperti Drawer, Snack-Bar, Bottom-Navigation-Bar, Floating-Action-Button, App-Bar, dll. Scaffold akan memperluas atau mengisi seluruh layar perangkat. Ini akan mengambil ruang yang tersedia. Scaffold akan memberikan kerangka kerja untuk mengimplementasikan tata letak desain material dasar dari aplikasi.

- **Container:** 
Widget kenyamanan yang menggabungkan widget umum seperti painting, positioning, dan sizing.

- **TextField:** 
TextField memungkinkan pengguna memasukkan teks, baik dengan keyboard fisik atau keyboard di layar.

- **ElevatedButton:**
ElevatedButton adalah label child yang ditampilkan pada widget Material yang Material.elevation-nya meningkat saat tombol ditekan.

- **FutureBuilder:** 
Widget yang membangun dirinya berdasarkan snapshot terbaru dari interaksi dengan Future.

- **SnackBar:**
SnackBar adalah widget Flutter yang memungkinkan Anda untuk sementara menampilkan pesan pop-up dalam aplikasi Anda.

- **Navigator:**
Widget yang mengelola set anak widget dengan disiplin tumpukan.

- **ListView.builder:**
Konstruktor ListView.builder mengambil IndexedWidgetBuilder, yang membangun anak-anak secara on demand.


# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

- Membuat file login.dart di dalam lib/screens/
```
import 'package:stock_mates/screens/menu.dart';
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
                                final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
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
                    ],
                ),
            ),
        );
    }
}
```
- Mengintegrasikan sistem autentikasi Django dengan proyek tugas flutter 
1. Membuat app authentication : python manage.py startapp
2. Memotivasi requirements.txt
```
django
gunicorn
whitenoise
psycopg2-binary
requests
urllib3
django-environ
```
3. Melakukan pip install -r requirements.txt
4. memodifikasi settings.py project Django
```
"""
Django settings for StockTracker project.

Generated by 'django-admin startproject' using Django 4.2.5.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.2/ref/settings/
"""
from pathlib import Path
import environ 
import os
from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent
env = environ.Env() 

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = "django-insecure-w-u!6knhv@518k#eu@7j4$8q^l_fwm*)^i*drmetye)=mek+23"
PRODUCTION = env.bool('PRODUCTION', False)
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ["*"]


# Application definition

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "main",
    "authentication",
    "corsheaders",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "corsheaders.middleware.CorsMiddleware",
]

ROOT_URLCONF = "StockTracker.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [BASE_DIR / 'templates'],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        
        },
    },
]

WSGI_APPLICATION = "StockTracker.wsgi.application"


# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": BASE_DIR / "db.sqlite3",
    }
}

# Set database settings automatically using DATABASE_URL.
if PRODUCTION:
    DATABASES = {
        'default': env.db('DATABASE_URL')
    }
    DATABASES["default"]["ATOMIC_REQUESTS"] = True


# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.2/topics/i18n/

LANGUAGE_CODE = "en-us"

TIME_ZONE = "UTC"

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = "static/"
STATIC_ROOT = os.path.join(BASE_DIR, 'static')

# Default primary key field type
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
- memodifikasi views.py pada app authentication
```from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
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

@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```
5. Membuat file urls.py pada app authentication
```
from django.urls import path
from authentication.views import login, logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
]
```
6. Memodifikasi urls.py pada folder project django
```
"""
URL configuration for StockTracker project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('main.urls')),
    path('auth/', include('authentication.urls')),
]
```
7. Masuk ke project Flutter dan install dua package
```
flutter pub add provider
flutter pub add pbp_django_auth
```
8. Memodifikasi lib/main.dart
```
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:stock_mates/screens/login.dart';

void main() {
  runApp(const MyApp());
}

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
9. Memodifikasi lib/widgets/left_drawer.dart
```
import 'package:flutter/material.dart';
import 'package:stock_mates/screens/list_product.dart';
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
          // Kode ListTile Menu

          ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('Daftar Produk'),
              onTap: () {
                  // Route menu ke halaman produk
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductPage()),
                  );
              },
          ),


        ],
      ),
    );
  }
```
10. Memodifikasi lib/widgets/shop_card.dart
```
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:stock_mates/screens/daftar_list.dart';
import 'package:stock_mates/screens/list_product.dart';
import 'package:stock_mates/screens/login.dart';
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
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.cardColor,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
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
          else if (item.name == "Lihat Produk") {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductPage()));
          }
          else if (item.name == "Logout") {
                  final response = await request.logout("http://127.0.0.1:8000/auth/logout/");
                  String message = response["message"];
                  if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message"),
                    ));
                  }
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
11. Menambah file lib/screens/login.dart
```
import 'package:stock_mates/screens/menu.dart';
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
                                final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
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
                    ],
                ),
            ),
        );
    }
}
```

12. Membuat file lib/models/operator.dart dengan bantuan website http://app.quicktype.io/
```
// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    int price;
    String description;
    int amount;

    Fields({
        required this.user,
        required this.name,
        required this.dateAdded,
        required this.price,
        required this.description,
        required this.amount,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        price: json["price"],
        description: json["description"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "price": price,
        "description": description,
        "amount": amount,
    };
}
```
13. Memodifikasi lib/screens/stockmates_form.dart
```
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:stock_mates/widgets/left_drawer.dart';
import 'package:stock_mates/screens/menu.dart';

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
    final request = context.watch<CookieRequest>();
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
                    
                    onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                            // Kirim ke Django dan tunggu respons
              
                            final response = await request.postJson(
                            "http://127.0.0.1:8000/create-flutter/",
                            jsonEncode(<String, String>{
                                'name': _name,
                                'price': _price.toString(),
                                'description': _description,
                                'jumlah': _amount.toString(),
                            }));
                            if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                content: Text("Produk baru berhasil disimpan!"),
                                ));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyHomePage()),
                                );
                            } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                    content:
                                        Text("Terdapat kesalahan, silakan coba lagi."),
                                ));
                            }
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
**Diatas adalah cara saya mengerjakan berdasarkan chckpoint yang ada dan sebelum mengerjakan bonus.
</details>

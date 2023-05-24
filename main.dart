import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wireframe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController viewPertamaController = TextEditingController();
  TextEditingController viewKeduaController = TextEditingController();
  TextEditingController viewKetigaController = TextEditingController();
  bool switchValue = false;

  String nama = '';
  String prodi = '';
  String keperluanPeminajamanKendaraaan = '';
  String jenisKendaraan = '';
  String durasiPeminjamanKendaraan = '';
  String denganSopir = '';
  String dikerjakanOleh = '6701213033 - JURIZKI FARID';

  void publishData() {
    setState(() {
      nama = viewPertamaController.text;
      prodi = viewKeduaController.text;
      keperluanPeminajamanKendaraaan = viewKetigaController.text;
      jenisKendaraan = switchValue ? 'Avanza/Xenia' : 'Elf';
      durasiPeminjamanKendaraan = switchValue ? '12jam' : '18jam';
      denganSopir = switchValue ? 'Ya' : 'Tidak';

      // NIM dan Nama dapat ditambahkan sesuai dengan informasi pribadi Anda
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage(
          nama: nama,
          prodi: prodi,
          keperluanPeminjamanKendaraan: keperluanPeminajamanKendaraaan,
          jenisKendaraan: jenisKendaraan,
          durasiPeminjamanKendaraan: durasiPeminjamanKendaraan,
          denganSopir: denganSopir,
          dikerjakanOleh: dikerjakanOleh,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wireframe'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: viewPertamaController,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: viewKeduaController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Prodi & Fakultas',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: viewKetigaController,
              decoration: InputDecoration(
                labelText: 'Keperluan Peminjaman Kendaraan',
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            Text('Jenis Kendaraan'),
            RadioListTile(
              title: Text('Avanza/Xenia'),
              value: 1,
              groupValue: null,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: Text('Civic'),
              value: 2,
              groupValue: null,
              onChanged: (value) {},
            ),
            Text('Durasi Peminjaman Kendaraan'),
            RadioListTile(
              title: Text('12 Jam'),
              value: 1,
              groupValue: null,
              onChanged: (value) {},
            ),
            RadioListTile(
              title: Text('18 Jam'),
              value: 2,
              groupValue: null,
              onChanged: (value) {},
            ),
            SizedBox(height: 16.0),
            Text('Dengan Sopir'),
            Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: publishData,
              child: Text('KIRIM PERMINTAAN'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String nama;
  final String prodi;
  final String keperluanPeminjamanKendaraan;
  final String jenisKendaraan;
  final String durasiPeminjamanKendaraan;
  final String denganSopir;
  final String dikerjakanOleh;

  SecondPage({
    required this.nama,
    required this.prodi,
    required this.keperluanPeminjamanKendaraan,
    required this.jenisKendaraan,
    required this.durasiPeminjamanKendaraan,
    required this.denganSopir,
    required this.dikerjakanOleh,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Barang'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama : $nama'),
            SizedBox(height: 8.0),
            Text('Prodi : $prodi'),
            SizedBox(height: 8.0),
            Text(
                'Keperluan Peminjaman Kendaraan: $keperluanPeminjamanKendaraan'),
            SizedBox(height: 8.0),
            Text('Jenis Kendaraan: $jenisKendaraan'),
            SizedBox(height: 8.0),
            Text('Durasi Peminjaman Kendaraan : $durasiPeminjamanKendaraan'),
            SizedBox(height: 8.0),
            Text('Dengan Sopir: $denganSopir'),
            SizedBox(height: 8.0),
            Text('Dikerjakan oleh: $dikerjakanOleh'),
          ],
        ),
     ),
);
}
}
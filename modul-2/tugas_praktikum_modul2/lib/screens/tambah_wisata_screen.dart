import 'package:flutter/material.dart';

class TambahWisata extends StatefulWidget {
  const TambahWisata({Key? key}) : super(key: key);

  @override
  State<TambahWisata> createState() => _TambahWisataState();
}

class _TambahWisataState extends State<TambahWisata> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _namaController = TextEditingController();
  TextEditingController _lokasiController = TextEditingController();
  TextEditingController _hargaController = TextEditingController();
  TextEditingController _deskripsiController = TextEditingController();

  String? _jenisWisata;
  final List<String> _jenisWisataList = ['Pegunungan', 'Pantai', 'Religi'];

  void _resetForm() {
    _formKey.currentState?.reset();
    _namaController.clear();
    _lokasiController.clear();
    _hargaController.clear();
    _deskripsiController.clear();
    setState(() {
      _jenisWisata = null;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String nama = _namaController.text;
      String lokasi = _lokasiController.text;
      String jenis = _jenisWisata ?? '';
      String harga = _hargaController.text;
      String deskripsi = _deskripsiController.text;

      print('Nama: $nama');
      print('Lokasi: $lokasi');
      print('Jenis: $jenis');
      print('Harga: $harga');
      print('Deskripsi: $deskripsi');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Berhasil tersimpan')),
      );

      _resetForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Wisata')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.add_photo_alternate_outlined, size: 50),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Fitur upload belum tersedia')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text('Upload Image'),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama Wisata'),
                validator: (value) =>
                    value!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              TextFormField(
                controller: _lokasiController,
                decoration: InputDecoration(labelText: 'Lokasi Wisata'),
                validator: (value) =>
                    value!.isEmpty ? 'Lokasi wajib diisi' : null,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Jenis Wisata'),
                value: _jenisWisata,
                onChanged: (value) {
                  setState(() {
                    _jenisWisata = value;
                  });
                },
                items: _jenisWisataList
                    .map((jenis) =>
                        DropdownMenuItem(value: jenis, child: Text(jenis)))
                    .toList(),
                validator: (value) =>
                    value == null ? 'Jenis wisata wajib dipilih' : null,
              ),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Harga Tiket'),
                validator: (value) =>
                    value!.isEmpty ? 'Harga tiket wajib diisi' : null,
              ),
              TextFormField(
                controller: _deskripsiController,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Deskripsi'),
                validator: (value) =>
                    value!.isEmpty ? 'Deskripsi wajib diisi' : null,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text('Simpan'),
              ),
              TextButton(
                onPressed: _resetForm,
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

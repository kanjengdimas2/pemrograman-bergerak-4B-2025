import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/tambah_wisata_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(WisataApp());
}

class WisataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/tambah': (context) => TambahWisata(),
        '/detail': (context) => DetailScreen(),
      },
    );
  }
}

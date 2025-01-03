import 'package:flutter/material.dart';
import 'package:jualbeli/widgets/left_drawer.dart';
import 'package:jualbeli/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.shopping_bag),
    ItemHomepage("Tambah Produk", Icons.add_shopping_cart),
    ItemHomepage("Logout", Icons.logout),
  ];

  final List<Color> buttonColors = [
    Colors.blue,  // Warna untuk Lihat Daftar Produk
    Colors.green,  // Warna untuk Tambah Produk
    Colors.red,  // Warna untuk Logout
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jual Beli',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Welcome to Jual Beli',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items.asMap().entries.map((entry) {
                return ItemCard(
                  entry.value,
                  cardColor: buttonColors[entry.key],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
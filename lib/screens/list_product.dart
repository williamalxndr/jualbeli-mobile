import 'package:flutter/material.dart';
import 'package:jualbeli/models/product_entry.dart';
import 'package:jualbeli/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object ProductEntry
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada product.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        elevation: 4,
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
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
                                      "Rp${snapshot.data![index].fields.price}",
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Description: ${snapshot.data![index].fields.description}",
                                      style: const TextStyle(fontSize: 14.0),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Stock: ${snapshot.data![index].fields.stock}",
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Category: ${snapshot.data![index].fields.category}",
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Rating: ${snapshot.data![index].fields.ratings}",
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                      )
                                    ),
                                    const SizedBox(height: 10),
                                ],
                            ),
                        ),
                    ),
                );
            }
          }
        },
      ),
    );
  }
}
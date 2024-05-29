import 'package:dars46/controllers/products_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screens"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
        future: productsController.list,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          return !snapshot.hasData || snapshot.data!.isEmpty
              ? const Center(
                  child: Text("Mahsulotlar mavjud emas"),
                )
              : ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    final product = snapshot.data![index];
                    return ListTile(
                      title: Text(product.title),
                      subtitle: Text("\$${product.price}"),
                    );
                  },
                );
        },
      ),
    );
  }
}

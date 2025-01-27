import 'dart:convert';

import 'package:dars46/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsHttpServices {
  
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse(
        "https://dars46-7f132-default-rtdb.firebaseio.com/products.json");

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<Product> loadedProducts = [];

    if (data != null) {
      data.forEach((key, value) {
        value['id'] = key;
        loadedProducts.add(
          Product.fromJson(value),
        );
      });
    }

    return loadedProducts;
  }
}

import 'package:dars46/models/product.dart';
import 'package:dars46/services/products_http_services.dart';

class ProductsController {
  final productsHttpServices = ProductsHttpServices();

  // ignore: prefer_final_fields
  List<Product> _list = [
    Product(
      id: "1",
      title: "iPhone 11",
      price: 350.45,
    ),
  ];

  Future<List<Product>> get list async {
   _list = await productsHttpServices.getProducts();

    return [..._list];
  }
}

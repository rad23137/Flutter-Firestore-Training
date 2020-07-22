import 'package:flutter/material.dart';
import 'package:shop_app/dummy_products.dart';
import 'package:shop_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}

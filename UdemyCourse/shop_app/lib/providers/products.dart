import 'package:flutter/material.dart';
import 'package:shop_app/dummy_products.dart';
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

 // var _showFavoritesOnly = false;

  List<Product> get items {
   // if (!_showFavoritesOnly)
      return [..._items];
     
  }


 List<Product> get favItems
 {
   return _items.where((prod) => prod.isFavorite == true).toList();
 }


  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}

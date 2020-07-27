import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/http_exception.dart';
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (!_showFavoritesOnly)
    return [..._items];
  }

  List<Product> get favItems {
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

  Future<void> fetchAndSetProducts() async {
    const url = 'https://flutter-project-f422c.firebaseio.com/products.json';

    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
            id: prodId,
            title: prodData['title'],
            price: prodData['price'],
            description: prodData['description'],
            imageUrl: prodData['imageUrl'],
            isFavorite: prodData['isFavorite']));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      //throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    //_items.add(value);

    const url =
        'https://flutter-project-f422c.firebaseio.com/products.json'; // url of database
    try {
      final response = await http.post(url,
          body: json.encode({
            // http post request to add a product
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'isFavorite': product.isFavorite
          }));

      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url =
          'https://flutter-project-f422c.firebaseio.com/products/$id.json';
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://flutter-project-f422c.firebaseio.com/products/$id.json';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
     _items.removeAt(existingProductIndex);
    notifyListeners();
    final response= await http.delete(url);
      if (response.statusCode >= 400) {
         _items.insert(existingProductIndex, existingProduct);
            notifyListeners();
        throw HttpException('Could not delete product');
      }
      existingProduct = null;


   
  }
}

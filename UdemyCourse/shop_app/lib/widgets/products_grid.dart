import 'package:flutter/material.dart';
import 'package:shop_app/providers/products.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final _showFavs;

  ProductsGrid(this._showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = _showFavs? productsData.favItems: productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: products[
                  index], // used value not create cz using existing products, more efficient
              child: ProductItem(
                  //products[index].id,
                  // products[index].title,
                  //products[index].imageUrl
                  ),
            ),
        itemCount: products.length);
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';


  Future<void> _refreshProducts(BuildContext context) async
  {
      await Provider.of<Products>(context).fetchAndSetProducts();
  }
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
           onRefresh: ()=>_refreshProducts(context),
              child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemBuilder: (context, i) => Column(children: <Widget>[
                UserProductItem(productData.items[i].id, productData.items[i].title, productData.items[i].imageUrl),
                Divider(),
              ]),
              itemCount: productData.items.length,
            )),
      ),
    );
  }
}

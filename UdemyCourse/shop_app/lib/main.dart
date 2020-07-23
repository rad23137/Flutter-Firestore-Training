import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [  // USed to use multiple providers in a same file
      ChangeNotifierProvider(
      create: (ctx)=> Products()), 
      ChangeNotifierProvider(
        create: (ctx)=> Cart(),)

    ],
     // use create because new product will be created its better choice than value
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'My Shop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            //fontFamily: 'Lato',
            
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName:(context)=>CartScreen(),
          },
    )
    );
  }
}

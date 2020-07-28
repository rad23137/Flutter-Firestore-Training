import 'package:flutter/material.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/user_products_screen.dart';

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
        create: (ctx)=> Cart(),),

        ChangeNotifierProvider(
          create: (ctx)=>Orders(),),

          ChangeNotifierProvider(
            create: (ctx)=>Auth(),)

    ],
     // use create because new product will be created its better choice than value
      child: Consumer<Auth>(builder: (context,auth,_)=>
       MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'My Shop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            //fontFamily: 'Lato',
            
          ),
          home: auth.isAuth? ProductsOverviewScreen(): AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName:(context)=>CartScreen(),
            OrderScreen.routeName: (context)=> OrderScreen(),
            UserProductsScreen.routeName: (context)=> UserProductsScreen(),
            EditProductScreen.routeName: (context)=> EditProductScreen(),
          },
    ))
     
    );
  }
}

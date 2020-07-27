import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';



  // var _isLoading = false;
  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((_) async {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //    await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //  final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(title: Text('Your Orders')),
        drawer: AppDrawer(),
        body: FutureBuilder(
            future:
                Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
            builder: (context, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator());
              }
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text('An  error Occured'),
                );
              } else {
                return Consumer<Orders>(
                    builder: (context, orderData, child) => ListView.builder(
                          itemBuilder: (context, i) =>
                              OrderItem(orderData.orders[i]),
                          itemCount: orderData.orders.length,
                        ));
              }
            }));
  }
}

import 'package:flutter/material.dart';

import 'main.dart';
class CartPage extends StatelessWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    int totalProducts = cartItems.fold(0, (sum, product) => sum + product.counter);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Total Products in Cart: $totalProducts',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w700),),
            SizedBox(height: 20),
            Text('Products in Cart:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: cartItems
                  .where((product) => product.counter > 0)
                  .map((product) => ListTile(
                title: Text('${product.name}: ${product.counter}'),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
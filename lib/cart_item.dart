import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Models/cart_model.dart';

class CartItem extends StatelessWidget {
  final CartItems cartItems;

  CartItem(this.cartItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text(
                    '\$' + cartItems.product.price.toStringAsFixed(2),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
            Container(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        cartItems.product.title,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Total: \$' + '${cartItems.total.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.centerRight,
              child: Text(
                '${cartItems.count}x',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

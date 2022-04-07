import 'package:baitapbuoi5/Models/total_cartitem.dart';
import 'package:baitapbuoi5/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 70,
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
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.purple),
                                child: Text(
                                  '\$' + cartProduct.total.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white54),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.purple),
                                child: Text(
                                  'ORDER NOW',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 250,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: cartProduct.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = cartProduct.cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            cartProduct
                                .removeFromCart(cartProduct.cartItems[index]);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('${item.product.title} đã bị xóa')));
                        },
                        child: CartItem(
                          cartProduct.cartItems[index],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

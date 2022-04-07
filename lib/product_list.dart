import 'package:baitapbuoi5/Models/product_model.dart';
import 'package:baitapbuoi5/Models/total_cartitem.dart';
import 'package:baitapbuoi5/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('MyShop'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
          Stack(
            children: [
              Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  ).then((_) {
                    // This block runs when you have returned back to the 1st Page from 2nd.
                    setState(() {
                      // Call setState to refresh the page.
                    });
                  }),
                ),
              ),
              Positioned(
                right: 10,
                top: 12,
                child: Container(
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purple),
                  child: Text(
                    cartProduct.count.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3 / 2),
        children: [
          for (int i = 0; i < productList.length; i++)
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsDetail(productList[i]),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(8),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        productList[i].image,
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0))),
                      height: 50,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              productList[i].favorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Color(0xFF9F28B4),
                            ),
                            onPressed: () {
                              setState(() {
                                productList[i].favorite =
                                    !productList[i].favorite;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              productList[i].title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14),
                            ),
                            flex: 1,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: Color(0xFF9F28B4),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Đã thêm vào giỏ hàng'),
                                ),
                              );
                              setState(() {
                                cartProduct.addToCart(productList[i]);
                              });
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    ));
  }
}

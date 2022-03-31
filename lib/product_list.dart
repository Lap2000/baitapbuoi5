import 'package:baitapbuoi5/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Product {
  final String title;
  final String image;
  final double price;
  final String description;

  Product(this.title, this.image, this.price, this.description);
}

late List<Product> productList = [
  Product(
      'Áo sơ mi',
      'https://4men.com.vn/thumbs/2016/07/ao-so-mi-han-quoc-cam-tron-asm788-4007-p.jpg',
      19.99,
      'Áo sơ mi siêu đẹp'),
  Product(
      'Áo Hoodie',
      'https://mikaystore.com/wp-content/uploads/2021/01/Ao-hoodie-nu-danh-cho-nhung-ban-mac-di-hoc-2.png',
      24.99,
      'Áo hoodie mới nhất'),
  Product(
      'Áo thun',
      'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/434247/item/goods_00_434247.jpg?width=1600&impolicy=quality_75',
      14.99,
      'Áo thun chất lượng'),
];

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
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: (200 / 150)),
          itemCount: productList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsDetail(productList[index]),
                    ),
                  );
                },
                child: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(productList[index].image,
                          fit: BoxFit.cover),
                      Positioned(
                        height: 40,
                        width: 210,
                        bottom: 0,
                        child: Container(
                          color: Colors.black.withOpacity(0.85),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.purple,
                                  )),
                              Text(
                                productList[index].title,
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart,
                                      color: Colors.purple)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }
}

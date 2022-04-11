import 'package:baitapbuoi5/Models/product_model.dart';

class CartItems {
  Product product;
  int count;
  double total;

  CartItems({required this.product, required this.count, required this.total});

  void addcount() {
    count = count + 1;
    total = total + product.price;
  }

  void addCountNum(int num) {
    count = count + num;
    total = total + product.price * num;
  }

  void subcount() {
    count = count - 1;
    total = total - product.price;
  }
}

import 'package:baitapbuoi5/Models/cart_model.dart';
import 'package:baitapbuoi5/Models/product_model.dart';

class CartTotal {
  List<CartItems> cartItems = [];

  double get total {
    return cartItems.fold(0.0, (double currentTotal, CartItems nextCartItem) {
      return currentTotal + nextCartItem.total;
    });
  }

  void addToCart(Product product) {
    bool isAdd = false;
    if (cartItems.length == 0) {
      print('add if 1');
      CartItems cartItem =
          CartItems(product: product, total: product.price, count: 1);
      cartItems.add(cartItem);
    } else {
      for (int i = 0; i < cartItems.length; i++) {
        print(product.title);
        print(cartItems[i].product.title);
        if (product == cartItems[i].product) {
          print('add if 2');
          cartItems[i].addcount();
          isAdd = true;
          break;
        }
      }
      if (!isAdd) {
        CartItems cartItem =
            CartItems(product: product, total: product.price, count: 1);
        cartItems.add(cartItem);
      }
    }
  }

  void subItemCart(Product product) {
    for (int i = 0; i < cartItems.length; i++) {
      if (product == cartItems[i].product) {
        if (cartItems[i].count <= 1) {
          cartItems.remove(cartItems[i]);
        } else {
          cartItems[i].subcount();
        }
      }
    }
  }

  void removeFromCart(CartItems cartItem) {
    cartItems.remove(cartItem);
  }
}

late CartTotal cartProduct = CartTotal();

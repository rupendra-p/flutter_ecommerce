import '/models/product.dart';
import '/models/cart.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];
  List<Cart> get cart => _carts;

  addToCart(Product product, int numberOfItem) {
    final cart = checkIsInCart(product.id);
    if (cart != null) {
      final indexOfCart = _carts.indexOf(cart);
      _carts.removeAt(indexOfCart);
      _carts.insert(indexOfCart,
          Cart(product: product, numOfItem: cart.numOfItem + numberOfItem));
    } else {
      _carts.add(Cart(product: product, numOfItem: numberOfItem));
    }
    notifyListeners();
  }

  Cart? checkIsInCart(int id) {
    return _carts.firstWhere((element) => element.product.id == id);
  }

  removeFromCart(Product product) {
    final cart = checkIsInCart(product.id);
    if (cart != null) {
      _carts.remove(cart);
    }
    notifyListeners();
  }
}

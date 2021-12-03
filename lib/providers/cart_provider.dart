import '/models/product.dart';
import '/models/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

class CartProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Cart> _carts = [
    Cart(product: demoProducts[0], numOfItem: 2),
    Cart(product: demoProducts[1], numOfItem: 1),
    Cart(product: demoProducts[3], numOfItem: 1),
  ];
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
    return _carts.firstWhereOrNull(
      (element) => element.product.id == id,
    );
  }

  removeFromCart(Product product) {
    final cart = checkIsInCart(product.id);
    if (cart != null) {
      _carts.remove(cart);
    }
    notifyListeners();
  }

  int gettotalCartItems() {
    if (_carts.isEmpty) {
      return 0;
    }
    var numberOfItems = 0;
    for (var element in _carts) {
      numberOfItems += element.numOfItem;
    }
    return numberOfItems;
  }
}

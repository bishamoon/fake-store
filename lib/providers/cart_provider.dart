import 'package:flutter/material.dart';
import 'package:fakestore_ecommerce/models/product_model.dart'; // Adjust import path if necessary

class CartProvider with ChangeNotifier {
  final Map<int, int> _cartItems = {}; // Product ID -> Quantity

  Map<int, int> get cartItems => _cartItems;

  void addToCart(int productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId] = _cartItems[productId]! + 1;
    } else {
      _cartItems[productId] = 1;
    }
    print('Added to cart: $productId'); // Debug statement
    notifyListeners();
  }

  void removeFromCart(int productId) {
    if (_cartItems.containsKey(productId)) {
      if (_cartItems[productId]! > 1) {
        _cartItems[productId] = _cartItems[productId]! - 1;
      } else {
        _cartItems.remove(productId);
      }
      print('Removed from cart: $productId'); // Debug statement
      notifyListeners();
    }
  }

  int getCartItemCount() {
    return _cartItems.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double getTotalPrice(Map<int, Product> products) {
    double total = 0.0;
    _cartItems.forEach((productId, quantity) {
      final product = products[productId];
      if (product != null) {
        total += product.price * quantity;
      }
    });
    return total;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

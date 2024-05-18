import 'package:e_store/models/cart_model.dart';
import 'package:e_store/models/product_model.dart';
import 'package:e_store/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  bool isProductInCart({required productId}) {
    return _cartItems.containsKey(productId);
  }

  void addProductToCart({required productId}) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
        cartId: const Uuid().v4(),
        productId: productId,
        quantity: 1,
      ),
    );
    notifyListeners();
  }

  void updateQuantity({required String productId, required int quantity}) {
    _cartItems.update(
      productId,
      (item) => CartModel(
        cartId: item.cartId,
        productId: item.productId,
        quantity: quantity,
      ),
    );
    notifyListeners();
  }

  int getQuantity() {
    int total = 0;
    _cartItems.forEach(
      (key, value) {
        total += value.quantity;
      },
    );
    return total;
  }

  double getTotalPrice({required ProductProvider productProvider}) {
    double totalPrice = 0.0;
    _cartItems.forEach(
      (key, value) {
        final ProductModel? getCurrentProduct =
            productProvider.findProductById(value.productId);
        if (getCurrentProduct != null) {
          double productPrice =
              double.tryParse(getCurrentProduct.productPrice) ?? 0.0;
          totalPrice += productPrice * value.quantity;
        }
      },
    );
    return double.parse(totalPrice.toStringAsFixed(2));
  }

  void removeProductFromCart({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearLocalCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

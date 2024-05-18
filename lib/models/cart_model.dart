import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  final String productId, cartId;
  final int quantity;

  CartModel({
    required this.productId,
    required this.cartId,
    required this.quantity,
  });
}

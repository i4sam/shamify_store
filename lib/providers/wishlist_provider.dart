import 'package:e_store/models/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, ViewedProductModel> _wishlistItems = {};
  Map<String, ViewedProductModel> get getWishlistItems {
    return _wishlistItems;
  }

  bool isProductInWishlist({required productId}) {
    return _wishlistItems.containsKey(productId);
  }

  void addOrRemoveFromWishlist({required productId}) {
    if (_wishlistItems.containsKey(productId)) {
      _wishlistItems.remove(productId);
    } else {
      _wishlistItems.putIfAbsent(
        productId,
        () => ViewedProductModel(
          productId: productId,
          id: const Uuid().v4(),
        ),
      );
    }
    notifyListeners();
  }

  void clearLocalWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}

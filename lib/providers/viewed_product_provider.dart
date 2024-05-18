import 'package:e_store/models/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ViewedProductProvider with ChangeNotifier {
  final Map<String, ViewedProductModel> _viewedProductItems = {};
  Map<String, ViewedProductModel> get getViewedProductItems {
    return _viewedProductItems;
  }

  bool isProductInViewedProducts({required productId}) {
    return _viewedProductItems.containsKey(productId);
  }

  void addProductToHistory({required productId}) {
    _viewedProductItems.putIfAbsent(
      productId,
      () => ViewedProductModel(
        productId: productId,
        id: const Uuid().v4(),
      ),
    );

    notifyListeners();
  }

  void clearViewedHistory() {
    _viewedProductItems.clear();
    notifyListeners();
  }
}

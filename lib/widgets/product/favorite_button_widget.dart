import 'package:e_store/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final bool isProductInWishlist =
        wishlistProvider.isProductInWishlist(productId: widget.productId);

    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.red,
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          wishlistProvider.addOrRemoveFromWishlist(
            productId: widget.productId,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            IconlyBold.heart,
            color: isProductInWishlist ? Colors.red : Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }
}

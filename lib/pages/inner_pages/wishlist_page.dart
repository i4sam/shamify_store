import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:e_store/pages/cart/bottom_checkout.dart';
import 'package:e_store/providers/wishlist_provider.dart';
import 'package:e_store/services/app_methods.dart';
import 'package:e_store/services/assets_manager.dart';
import 'package:e_store/widgets/empty_cart_widget.dart';
import 'package:e_store/widgets/product/product_widget.dart';
import 'package:e_store/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});
  static const String routeName = "/WishlistPage";

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final bool isWishlistEmpty = wishlistProvider.getWishlistItems.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TitleWidget(
            label: 'Wishlist (${wishlistProvider.getWishlistItems.length})',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            IconlyLight.arrowLeft2,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                AppMethods.showMessageDialog(
                  context,
                  title: 'Clearing Wishlist!',
                  message: 'Are you sure you want to clear your wishlist?',
                  errorMessage: '',
                  isError: false,
                  fct: () {
                    wishlistProvider.clearLocalWishlist();
                    Navigator.pop(context);
                  },
                );
              },
              icon: const Icon(
                Icons.delete_forever_rounded,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: isWishlistEmpty
          ? EmptyCartWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: 'Your cart is empty!',
              subtitle:
                  'It looks like you didn\'t add anything to your cart.\nGo ahead and start shopping now!',
              buttonText: 'Shop Now!',
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                    child: DynamicHeightGridView(
                      itemCount: wishlistProvider.getWishlistItems.length,
                      crossAxisCount: 2,
                      builder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductWidget(
                            productId: wishlistProvider.getWishlistItems.values
                                .toList()[index]
                                .productId,
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                  const BottomCheckoutWidget(),
                ],
              ),
            ),
    );
  }
}

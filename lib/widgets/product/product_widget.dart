import 'package:e_store/pages/inner_pages/product_details_page.dart';
import 'package:e_store/providers/cart_provider.dart';
import 'package:e_store/providers/product_provider.dart';
import 'package:e_store/providers/viewed_product_provider.dart';
import 'package:e_store/widgets/image_loader.dart';
import 'package:e_store/widgets/product/favorite_button_widget.dart';
import 'package:e_store/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../icon_widget.dart';
import '../title_widget.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final viewedProductProvider = Provider.of<ViewedProductProvider>(context);

    final getCurrentProduct = productProvider.findProductById(widget.productId);
    final cartProvider = Provider.of<CartProvider>(context);

    if (getCurrentProduct == null) {
      return const SizedBox.shrink();
    }

    final isProductInCart =
        cartProvider.isProductInCart(productId: getCurrentProduct.productId);
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        viewedProductProvider.addProductToHistory(
            productId: getCurrentProduct.productId);
        Navigator.pushNamed(
          context,
          ProductDetailsPage.routeName,
          arguments: getCurrentProduct.productId,
        );
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ImageLoader(
                  imagePath: getCurrentProduct.productImage,
                  width: double.infinity,
                  height: size.width * 0.4,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 5,
                      child: TitleWidget(
                        fontSize: 18,
                        label: getCurrentProduct.productTitle,
                        maxLines: 2,
                      ),
                    ),
                    Flexible(
                      child: FavoriteButtonWidget(
                        productId: getCurrentProduct.productId,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: SubtitleWidget(
                        color: Colors.blue,
                        label: '${getCurrentProduct.productPrice}\$',
                      ),
                    ),
                    IconWidget(
                      icon: isProductInCart
                          ? Icons.check
                          : Icons.add_shopping_cart_rounded,
                      function: () {
                        if (!isProductInCart) {
                          cartProvider.addProductToCart(
                            productId: getCurrentProduct.productId,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
              // child: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Text(
              //       getCurrentProduct.productRating.toString(), // Use actual rating
              //       style: const TextStyle(
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     const Icon(
              //       Icons.star,
              //       color: Colors.black,
              //       size: 16,
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
